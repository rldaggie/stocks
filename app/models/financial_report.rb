class FinancialReport < ActiveRecord::Base
  belongs_to :company
  
  attr_accessible :company_id, :period_ending, :period_type, :sec_filing_url
  
  validates :period_type,   :presence => true
  validates :period_ending, :presence => true
  
  PERIOD_TYPES = ['annual', 'quarterly']
end
