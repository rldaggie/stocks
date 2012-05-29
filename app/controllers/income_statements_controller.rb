class IncomeStatementsController < ApplicationController
  before_filter :get_company
  
  def index
    @income_statements = IncomeStatementDecorator.decorate(@company.income_statements.annual.recent)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @income_statements.formatted_hash }
    end
  end
  
  def annual
    @income_statements = IncomeStatementDecorator.decorate(@company.income_statements.annual.recent)
  end
  
  def quarterly
    @income_statements = IncomeStatementDecorator.decorate(@company.income_statements.quarterly.recent)
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
