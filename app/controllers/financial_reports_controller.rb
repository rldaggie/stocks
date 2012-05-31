class FinancialReportsController < ApplicationController
  before_filter :get_company
  
  # GET /financial_reports
  # GET /financial_reports.json
  def index
    @financial_reports = @company.financial_reports.annual.recent.include_statements
  end
  
  def annual
    @financial_reports = @company.financial_reports.annual.recent.include_statements
    render action: 'index'
  end
  
  def quarterly
    @financial_reports = @company.financial_reports.quarterly.recent.include_statements
    render action: 'index'
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
