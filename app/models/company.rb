class Company < ActiveRecord::Base
  attr_accessible :name, :ticker
  
  validates :ticker, :presence => true
  
  include Extensions::FetchCompanyDetails
  
  before_create :fetch_details
end
