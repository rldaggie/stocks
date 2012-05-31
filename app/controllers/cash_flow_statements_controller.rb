class CashFlowStatementsController < ApplicationController
  before_filter :get_company
  
  def index
    @cash_flow_statements = @company.cash_flow_statements.limit(25)
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
