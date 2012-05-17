class Company < ActiveRecord::Base
  attr_accessible :name, :ticker
  
  validates :ticker, :presence => true
  
  include Extensions::Fetch
  
  before_create :fetch_details
end
