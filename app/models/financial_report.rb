# == Schema Information
#
# Table name: financial_reports
#
#  id             :integer         not null, primary key
#  period_type    :string(255)
#  period_ending  :date
#  company_id     :integer
#  sec_filing_url :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class FinancialReport < ActiveRecord::Base
  belongs_to :company
  has_one :cash_flow_statement
  has_one :balance_sheet
  has_one :income_statement
  
  PERIOD_TYPES = ['annual', 'quarterly']
  QUARTERS = ['Q1', 'Q2', 'Q3', 'Q4']
  
  include Extensions::FinancialReportCreateFromFetch
  
  default_scope order('financial_reports.period_ending DESC')
  scope :annual, where(:period_type => 'annual')
  scope :quarterly, where(:period_type => FinancialReport::QUARTERS)
  scope :include_statements, includes(:income_statement, :balance_sheet, :cash_flow_statement)
  scope :recent, limit(5)
  
  attr_accessible :company_id, :period_ending, :period_type, :sec_filing_url
  
  validates :period_type,   :presence => true
  validates :period_ending, :presence => true
  
  class << self
    def statements_array
      [:income_statement, :balance_sheet, :cash_flow_statement]
    end
  end
  
  # GROWTH RATE CALCULATIONS
  def previous_report
    attrs = self.attributes
    self.class.where{(company_id == attrs['company_id']) & (period_type == attrs['period_type']) & (period_ending < attrs['period_ending'])}.include_statements.first
  end
  
  def calculate_growth_rates_for_statements!
    pr = previous_report
    return nil unless pr
    FinancialReport.statements_array.each do |statement|
      the_statement = eval "#{statement.to_s}"
      previous_statement = eval "pr.#{statement.to_s}"
      the_statement.calculate_growth_rates_from_statement!(previous_statement)
    end
  end
  # END GROWTH RATE CALCULATIONS
  
  # ANNUAL VS QUARTERLY
  def is_annual?
    period_type == 'annual'
  end
  
  def is_quarterly?
    FinancialReport::QUARTERS.include?(period_type)
  end
  # END ANNUAL VS QUARTERLY
end
