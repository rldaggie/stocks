class FinancialReport < ActiveRecord::Base
  belongs_to :company
  has_one :cash_flow_statement
  has_one :balance_sheet
  
  default_scope order('financial_reports.period_ending DESC')
  scope :annual, where(:period_type => 'annual')
  scope :quarterly, where(:period_type => 'quarterly')
  
  attr_accessible :company_id, :period_ending, :period_type, :sec_filing_url
  
  validates :period_type,   :presence => true
  validates :period_ending, :presence => true
  
  PERIOD_TYPES = ['annual', 'quarterly']
  
  class << self
    def create_from_array(the_array)
      the_array.each do |financial_report_hash|
        period_type = financial_report_hash[:period_type]
        period_ending = Date.strptime(financial_report_hash[:period_ending], "%m/%d/%Y")
        financial_report = find_or_create_by_period_type_and_period_ending(period_type, period_ending)
        financial_report.create_statements_from_hash(financial_report_hash[:financial_statements])
      end
    end
  end
  
  def create_statements_from_hash(the_hash)
    the_hash.each do |key, value|
      the_class = key.camelize.constantize
      the_hash = {:financial_report_id => id}.merge(value)
      the_class.create(the_hash)
    end
  end
end
