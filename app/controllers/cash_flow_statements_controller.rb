class CashFlowStatementsController < ApplicationController
  before_filter :get_company
  
  def index
    @cash_flow_statements = CashFlowStatementDecorator.decorate(@company.cash_flow_statements.annual.recent)
  end
  
  def annual
    @cash_flow_statements = CashFlowStatementDecorator.decorate(@company.cash_flow_statements.annual.recent)
  end
  
  def quarterly
    @cash_flow_statements = CashFlowStatementDecorator.decorate(@company.cash_flow_statements.quarterly.recent)
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
