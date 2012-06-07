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
  end
end
