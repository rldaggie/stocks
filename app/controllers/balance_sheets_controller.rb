class BalanceSheetsController < ApplicationController
  before_filter :get_company
  
  def index
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
