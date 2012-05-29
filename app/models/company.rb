class Company < ActiveRecord::Base
  has_many :financial_reports
  has_many :cash_flow_statements, :through => :financial_reports
  has_many :balance_sheets, :through => :financial_reports
  has_many :income_statements, :through => :financial_reports
  
  validates :ticker, :presence => true
  
  include Extensions::FetchCompanyDetails
  include Extensions::FetchFinancialReports
  include Extensions::CompanyUrls
  
  before_create :fetch_company_details
  
  def to_param
    ticker
  end
end
