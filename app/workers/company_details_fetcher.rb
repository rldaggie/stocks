class CompanyDetailsFetcher
  @queue = :fetch_company_details_queue
  def self.perform(company_id)
    company = Company.find(company_id)
    company.fetch_company_details
  end
end