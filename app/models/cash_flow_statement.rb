# == Schema Information
#
# Table name: cash_flow_statements
#
#  id                                                :integer         not null, primary key
#  financial_report_id                               :integer
#  operating_net_income                              :float
#  operating_depreciation                            :float
#  operating_amortization                            :float
#  operating_deferred_taxes                          :float
#  operating_non_cash_items                          :float
#  operating_changes_in_working_capital_items        :float
#  operating_total                                   :float
#  investing_capital_expenditures_items              :float
#  investing_other_items                             :float
#  investing_total                                   :float
#  financing_items                                   :float
#  financing_dividends                               :float
#  financing_stock                                   :float
#  financing_debt                                    :float
#  financing_total                                   :float
#  misc_foreign_exchange                             :float
#  net_cash_change                                   :float
#  net_cash_beginning                                :float
#  net_cash_ending                                   :float
#  created_at                                        :datetime        not null
#  updated_at                                        :datetime        not null
#  operating_net_income_growth                       :float
#  operating_depreciation_growth                     :float
#  operating_amortization_growth                     :float
#  operating_deferred_taxes_growth                   :float
#  operating_non_cash_items_growth                   :float
#  operating_changes_in_working_capital_items_growth :float
#  operating_total_growth                            :float
#  investing_capital_expenditures_items_growth       :float
#  investing_other_items_growth                      :float
#  investing_total_growth                            :float
#  financing_items_growth                            :float
#  financing_dividends_growth                        :float
#  financing_stock_growth                            :float
#  financing_debt_growth                             :float
#  financing_total_growth                            :float
#  misc_foreign_exchange_growth                      :float
#  net_cash_change_growth                            :float
#  net_cash_beginning_growth                         :float
#  net_cash_ending_growth                            :float
#

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
