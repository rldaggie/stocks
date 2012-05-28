class CreateBalanceSheets < ActiveRecord::Migration
  def change
    create_table :balance_sheets do |t|
      t.integer :financial_report_id
      [
        :assets_current_cash_and_short_term_investments,
        :assets_current_receivables,
        :assets_current_inventory,
        :assets_current_prepaid_expenses,
        :assets_current_other,
        :assets_current_total,
        :assets_other_property_plant_equipment,
        :assets_other_goodwill,
        :assets_other_intangibles,
        :assets_other_long_term_investments,
        :assets_other_receivables,
        :assets_other_misc,
        :assets_other_total,
        :assets_total,
        :liabilities_current_accounts_payable,
        :liabilities_current_payable_accrued,
        :liabilities_current_accrued_expenses,
        :liabilities_current_notes_payable,
        :liabilities_current_leases,
        :liabilities_current_other,
        :liabilities_current_total,
        :liabilities_other_debt,
        :liabilities_other_deferred_income_tax,
        :liabilities_other_minority_interest,
        :liabilities_other_misc,
        :liabilities_total,
        :equity_preferred_stock_redeemable,
        :equity_preferred_stock_non_redeemable,
        :equity_common_stock,
        :equity_additional_paid_in_capital,
        :equity_retained_earnings,
        :equity_treasury_stock,
        :equity_esop_debt_guarantee,
        :equity_unrealized_gain,
        :equity_other,
        :equity_total,
        :liabilities_and_equity_total,
        :shares_common_outstanding,
        :shares_preferred_outstanding
      ].each do |the_method|
        t.float the_method
      end

      t.timestamps
    end
    
    add_index :balance_sheets, :financial_report_id
  end
end
