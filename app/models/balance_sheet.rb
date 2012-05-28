class BalanceSheet < ActiveRecord::Base
  belongs_to :financial_report
  
  scope :annual, joins(:financial_report).merge(FinancialReport.annual)
  scope :quarterly, joins(:financial_report).merge(FinancialReport.quarterly)
  
  attr_accessible :financial_report_id, :assets_current_cash_and_short_term_investments, :assets_current_receivables, :assets_current_inventory, :assets_current_prepaid_expenses, :assets_current_other, :assets_current_total, :assets_other_property_plant_equipment, :assets_other_goodwill, :assets_other_intangibles, :assets_other_long_term_investments, :assets_other_receivables, :assets_other_misc, :assets_other_total, :assets_total, :liabilities_current_accounts_payable, :liabilities_current_payable_accrued, :liabilities_current_accrued_expenses, :liabilities_current_notes_payable, :liabilities_current_leases, :liabilities_current_other, :liabilities_current_total, :liabilities_other_debt, :liabilities_other_deferred_income_tax, :liabilities_other_minority_interest, :liabilities_other_misc, :liabilities_total, :equity_preferred_stock_redeemable, :equity_preferred_stock_non_redeemable, :equity_common_stock, :equity_additional_paid_in_capital, :equity_retained_earnings, :equity_treasury_stock, :equity_esop_debt_guarantee, :equity_unrealized_gain, :equity_other, :equity_total, :liabilities_and_equity_total, :shares_common_outstanding, :shares_preferred_outstanding
  
  ALL_ITEMS = [
    {
      :group_name => 'assets_current',
      :items => [
        :assets_current_cash_and_short_term_investments,
        :assets_current_receivables,
        :assets_current_inventory,
        :assets_current_prepaid_expenses,
        :assets_current_other,
        :assets_current_total
      ]
    },
    {
      :group_name => 'assets_other',
      :items => [
        :assets_other_property_plant_equipment,
        :assets_other_goodwill,
        :assets_other_intangibles,
        :assets_other_long_term_investments,
        :assets_other_receivables,
        :assets_other_misc,
        :assets_other_total,
        :assets_total
      ]
    },
    {
      :group_name => 'liabilities_current',
      :items => [
        :liabilities_current_accounts_payable,
        :liabilities_current_payable_accrued,
        :liabilities_current_accrued_expenses,
        :liabilities_current_notes_payable,
        :liabilities_current_leases,
        :liabilities_current_other,
        :liabilities_current_total
      ]
    },
    {
      :group_name => 'liabilities_other',
      :items => [
        :liabilities_other_debt,
        :liabilities_other_deferred_income_tax,
        :liabilities_other_minority_interest,
        :liabilities_other_misc,
        :liabilities_total
      ]
    },
    {
      :group_name => 'equity',
      :items => [
        :equity_preferred_stock_redeemable,
        :equity_preferred_stock_non_redeemable,
        :equity_common_stock,
        :equity_additional_paid_in_capital,
        :equity_retained_earnings,
        :equity_treasury_stock,
        :equity_esop_debt_guarantee,
        :equity_unrealized_gain,
        :equity_other,
        :equity_total
      ]
    },
    {
      :group_name => 'total_liabilties_and_equity',
      :items => [
        :liabilities_and_equity_total
      ]
    },
    {
      :group_name => 'shares_outstanding',
      :items => [
        :shares_common_outstanding,
        :shares_preferred_outstanding
      ]
    }
  ]
  
  ALL_ITEMS_KEYS = ALL_ITEMS.inject([]) do |the_array, group_hash|
    the_array << group_hash[:items]
    the_array
  end.flatten
  
  DOM_HASH = ALL_ITEMS_KEYS.inject({}) do |the_hash, item|
    the_hash[item] = I18n.t("balance_sheet.#{item.to_s}.dom_id")
    the_hash
  end
end
