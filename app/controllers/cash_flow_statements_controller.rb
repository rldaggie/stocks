class CashFlowStatementsController < ApplicationController
  before_filter :get_company
  
  def index
    @cash_flow_statements = @company.cash_flow_statements.annual.recent
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cash_flow_statements.formatted_hash }
    end
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
