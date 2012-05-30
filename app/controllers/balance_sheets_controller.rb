class BalanceSheetsController < ApplicationController
  before_filter :get_company
  
  def index
    @balance_sheets = @company.balance_sheets.annual.recent
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @balance_sheets.formatted_hash }
    end
  end
  
  private
  
  def get_company
    @company = Company.find_by_ticker(params[:company_id])
  end
end
