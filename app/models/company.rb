class Company < ActiveRecord::Base
  has_many :financial_reports
  
  attr_accessible :name, :ticker
  
  validates :name,    :presence => true
  validates :ticker,  :presence => true
  
  include Extensions::FetchCompanyDetails
  
  before_create :fetch_company_details
end
