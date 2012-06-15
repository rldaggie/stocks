# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  ticker     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Company < ActiveRecord::Base
  has_many :financial_reports
  has_many :cash_flow_statements, :through => :financial_reports
  has_many :balance_sheets, :through => :financial_reports
  has_many :income_statements, :through => :financial_reports
  
  attr_accessible :ticker, :name
  
  validates :ticker, :presence => true, :uniqueness => true
  
  include Extensions::FetchCompanyDetails
  include Extensions::FetchFinancialReports
  include Extensions::CompanyUrls
  
  after_create :fetch_all_company_info
  
  def fetch_all_company_info
    Resque.enqueue(CompanyDetailsFetcher, id)
    Resque.enqueue(FinancialReportsFetcher, id)
  end
  
  def ticker=(ticker)
    write_attribute(:ticker, ticker.downcase)
  end
  
  def to_param
    ticker
  end
end
