class CreateIncomeStatements < ActiveRecord::Migration
  def change
    create_table :income_statements do |t|
      t.integer :financial_report_id
      [
        :revenue,
        :revenue_other,
        :revenue_total,
        :cost_of_revenue,
        :income_gross,
        :op_expense_selling_general_admin,
        :op_expense_research_development,
        :op_expense_depreciation_amortization,
        :op_expense_interest,
        :op_expense_unusual,
        :op_expense_other,
        :income_operating,
        :non_op_expense_interest,
        :non_op_expense_asset_sale,
        :non_op_expense_other,
        :income_before_tax,
        :tax_income,
        :income_after_tax,
        :misc_expense_minority_interest,
        :misc_expense_equity_in_affiliates,
        :misc_expense_us_gaap_adjustment,
        :income_before_extra_items,
        :extra_items,
        :income_net,
        :adjustment_to_net_income
      ].each do |the_method|
        t.float the_method
      end
      
      t.timestamps
    end
    
    add_index :income_statements, :financial_report_id
  end
end
