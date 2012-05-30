class FinancialReport < ActiveRecord::Base
  belongs_to :company
  has_one :cash_flow_statement
  has_one :balance_sheet
  has_one :income_statement
  
  include Extensions::FinancialReportCreateFromFetch
  
  default_scope order('financial_reports.period_ending DESC')
  scope :annual, where(:period_type => 'annual')
  scope :quarterly, where(:period_type => 'quarterly')
  scope :include_statements, includes(:income_statement, :balance_sheet, :cash_flow_statement)
  scope :recent, limit(5)
  
  attr_accessible :company_id, :period_ending, :period_type, :sec_filing_url
  
  validates :period_type,   :presence => true
  validates :period_ending, :presence => true
  
  PERIOD_TYPES = ['annual', 'quarterly']
  
  class << self
    def statements_array
      [:income_statement, :balance_sheet, :cash_flow_statement]
    end
    
    def formatted_hash
      statements_array.inject({}) do |the_hash, statement|
        statements = eval("all.map { |fr| fr.#{statement.to_s} }")
        the_class = classify_string(statement)
        the_hash[statement] = {:statement_key => statement, :statement => the_class.formatted_hash_from_array(statements)}
        the_hash
      end
    end
    
    def classify_string(string)
      string.to_s.camelize.constantize
    end
  end
end
