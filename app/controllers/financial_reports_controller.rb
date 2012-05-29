class FinancialReportsController < ApplicationController
  before_filter :get_company
  
  # GET /financial_reports
  # GET /financial_reports.json
  def index
    @financial_reports = @company.financial_reports

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @financial_reports }
    end
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
