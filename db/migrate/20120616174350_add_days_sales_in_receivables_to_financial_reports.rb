class AddDaysSalesInReceivablesToFinancialReports < ActiveRecord::Migration
  def change
    add_column :financial_reports, :days_sales_in_receivables, :float
  end
end
