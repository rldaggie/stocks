class CashFlowStatement < ActiveRecord::Base
  belongs_to :financial_report
  
  scope :annual, joins(:financial_report).merge(FinancialReport.annual)
  scope :quarterly, joins(:financial_report).merge(FinancialReport.quarterly)
  
  attr_accessible :financial_report_id, :operating_net_income, :operating_depreciation, :operating_amortization, :operating_deferred_taxes, :operating_non_cash, :operating_changes_in_working_capital, :operating_total, :investing_capital_expenditures, :investing_other, :investing_total, :financing_items, :financing_dividends, :financing_stock, :financing_debt, :financing_total, :misc_foreign_exchange, :net_cash_change, :net_cash_beginning, :net_cash_ending
    
  ALL_ITEMS = [
    {
      :group_name => 'operating_items',
      :items => [
        :operating_net_income,
        :operating_depreciation,
        :operating_amortization,
        :operating_deferred_taxes,
        :operating_non_cash,
        :operating_changes_in_working_capital,
        :operating_total
      ]
    },
    {
      :group_name => 'investing_items',
      :items => [
        :investing_capital_expenditures,
        :investing_other,
        :investing_total
      ]
    },
    {
      :group_name => 'financing_items',
      :items => [
        :financing_items,
        :financing_dividends,
        :financing_stock,
        :financing_debt,
        :financing_total
      ]
    },
    {
      :group_name => 'misc_items',
      :items => [
        :misc_foreign_exchange
      ]
    },
    {
      :group_name => 'net_items',
      :items => [
        :net_cash_change
      ]
    },
    {
      :group_name => 'result_items',
      :items => [
        :net_cash_beginning,
        :net_cash_ending
      ]
    }
  ]
  
  ALL_ITEMS_KEYS = ALL_ITEMS.inject([]) do |the_array, group_hash|
    the_array << group_hash[:items]
    the_array
  end.flatten
  
  DOM_HASH = ALL_ITEMS_KEYS.inject({}) do |the_hash, item|
    the_hash[item] = I18n.t("cash_flow_statement.#{item.to_s}.dom_id")
    the_hash
  end
end
