class FinancialReportsController < ApplicationController
  before_filter :get_company
  
  # GET /financial_reports
  # GET /financial_reports.json
  def index
    @financial_reports = @company.financial_reports.annual.recent.include_statements
  end
  
  def annual
    @financial_reports = @company.financial_reports_table_hash('annual')
    render action: 'index'
  end
  
  def quarterly
    @financial_reports = @company.financial_reports_table_hash('quarterly')
    render action: 'index'
  end
  
  private
  
  def get_company
    @company = CompanyDecorator.find_by_ticker(params[:company_id])
  end
end
