# == Schema Information
#
# Table name: balance_sheets
#
#  id                                                    :integer         not null, primary key
#  financial_report_id                                   :integer
#  assets_current_cash_and_short_term_investments        :float
#  assets_current_receivables                            :float
#  assets_current_inventory                              :float
#  assets_current_prepaid_expenses                       :float
#  assets_current_other                                  :float
#  assets_current_total                                  :float
#  assets_other_property_plant_equipment                 :float
#  assets_other_goodwill                                 :float
#  assets_other_intangibles                              :float
#  assets_other_long_term_investments                    :float
#  assets_other_receivables                              :float
#  assets_other_misc                                     :float
#  assets_other_total                                    :float
#  assets_total                                          :float
#  liabilities_current_accounts_payable                  :float
#  liabilities_current_payable_accrued                   :float
#  liabilities_current_accrued_expenses                  :float
#  liabilities_current_notes_payable                     :float
#  liabilities_current_leases                            :float
#  liabilities_current_other                             :float
#  liabilities_current_total                             :float
#  liabilities_other_debt                                :float
#  liabilities_other_deferred_income_tax                 :float
#  liabilities_other_minority_interest                   :float
#  liabilities_other_misc                                :float
#  liabilities_total                                     :float
#  equity_preferred_stock_redeemable                     :float
#  equity_preferred_stock_non_redeemable                 :float
#  equity_common_stock                                   :float
#  equity_additional_paid_in_capital                     :float
#  equity_retained_earnings                              :float
#  equity_treasury_stock                                 :float
#  equity_esop_debt_guarantee                            :float
#  equity_unrealized_gain                                :float
#  equity_other                                          :float
#  equity_total                                          :float
#  liabilities_and_equity_total                          :float
#  shares_common_outstanding                             :float
#  shares_preferred_outstanding                          :float
#  created_at                                            :datetime        not null
#  updated_at                                            :datetime        not null
#  assets_current_cash_and_short_term_investments_growth :float
#  assets_current_receivables_growth                     :float
#  assets_current_inventory_growth                       :float
#  assets_current_prepaid_expenses_growth                :float
#  assets_current_other_growth                           :float
#  assets_current_total_growth                           :float
#  assets_other_property_plant_equipment_growth          :float
#  assets_other_goodwill_growth                          :float
#  assets_other_intangibles_growth                       :float
#  assets_other_long_term_investments_growth             :float
#  assets_other_receivables_growth                       :float
#  assets_other_misc_growth                              :float
#  assets_other_total_growth                             :float
#  assets_total_growth                                   :float
#  liabilities_current_accounts_payable_growth           :float
#  liabilities_current_payable_accrued_growth            :float
#  liabilities_current_accrued_expenses_growth           :float
#  liabilities_current_notes_payable_growth              :float
#  liabilities_current_leases_growth                     :float
#  liabilities_current_other_growth                      :float
#  liabilities_current_total_growth                      :float
#  liabilities_other_debt_growth                         :float
#  liabilities_other_deferred_income_tax_growth          :float
#  liabilities_other_minority_interest_growth            :float
#  liabilities_other_misc_growth                         :float
#  liabilities_total_growth                              :float
#  equity_preferred_stock_redeemable_growth              :float
#  equity_preferred_stock_non_redeemable_growth          :float
#  equity_common_stock_growth                            :float
#  equity_additional_paid_in_capital_growth              :float
#  equity_retained_earnings_growth                       :float
#  equity_treasury_stock_growth                          :float
#  equity_esop_debt_guarantee_growth                     :float
#  equity_unrealized_gain_growth                         :float
#  equity_other_growth                                   :float
#  equity_total_growth                                   :float
#  liabilities_and_equity_total_growth                   :float
#  shares_common_outstanding_growth                      :float
#  shares_preferred_outstanding_growth                   :float
#

require 'test_helper'

class BalanceSheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
