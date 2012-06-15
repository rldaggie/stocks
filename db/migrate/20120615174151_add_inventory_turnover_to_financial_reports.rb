class AddInventoryTurnoverToFinancialReports < ActiveRecord::Migration
  def change
    add_column :financial_reports, :inventory_turnover, :float
  end
end
