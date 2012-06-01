class CashFlowStatement < ActiveRecord::Base
  
  include Extensions::FinancialStatement
  
  attr_accessible :financial_report_id, :operating_net_income, :operating_depreciation, :operating_amortization, :operating_deferred_taxes, :operating_total, :investing_total, :financing_dividends, :financing_stock, :financing_debt, :financing_total, :misc_foreign_exchange, :net_cash_change, :net_cash_beginning, :net_cash_ending, :operating_non_cash_items, :operating_changes_in_working_capital_items, :investing_capital_expenditures_items, :investing_other_items, :financing_items
      
  class << self
    def all_items_hash
      [
        {
          :group_key => 'operating_items',
          :items => [
            :operating_net_income,
            :operating_depreciation,
            :operating_amortization,
            :operating_deferred_taxes,
            :operating_non_cash_items,
            :operating_changes_in_working_capital_items,
            :operating_total
          ]
        },
        {
          :group_key => 'investing_items',
          :items => [
            :investing_capital_expenditures_items,
            :investing_other_items,
            :investing_total
          ]
        },
        {
          :group_key => 'financing_items',
          :items => [
            :financing_items,
            :financing_dividends,
            :financing_stock,
            :financing_debt,
            :financing_total
          ]
        },
        {
          :group_key => 'misc_items',
          :items => [
            :misc_foreign_exchange
          ]
        },
        {
          :group_key => 'net_items',
          :items => [
            :net_cash_change
          ]
        },
        {
          :group_key => 'result_items',
          :items => [
            :net_cash_beginning,
            :net_cash_ending
          ]
        }
      ]
    end
  end
end
