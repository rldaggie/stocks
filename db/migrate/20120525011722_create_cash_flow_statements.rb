class CreateCashFlowStatements < ActiveRecord::Migration
  def change
    create_table :cash_flow_statements do |t|
      t.integer :financial_report_id
      [
        :operating_net_income,
        :operating_depreciation,
        :operating_amortization,
        :operating_deferred_taxes,
        :operating_non_cash_total,
        :operating_changes_in_working_capital_total,
        :operating_total,
        :investing_capital_expenditures_total,
        :investing_other_total,
        :investing_total,
        :financing_items,
        :financing_dividends,
        :financing_stock,
        :financing_debt,
        :financing_total,
        :misc_foreign_exchange,
        :net_cash_change,
        :net_cash_beginning,
        :net_cash_ending
      ].each do |the_method|
        t.float the_method
      end
      
      t.timestamps
    end
    
    add_index :cash_flow_statements, :financial_report_id
  end
end
