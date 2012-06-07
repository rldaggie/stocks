class FinancialReportsFetcher
  @queue = :fetch_financial_reports_queue
  def self.perform(company_id)
    company = Company.find(company_id)
    company.fetch_and_create_financial_reports
  end
end