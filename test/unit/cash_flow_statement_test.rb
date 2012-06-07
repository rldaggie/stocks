# == Schema Information
#
# Table name: cash_flow_statements
#
#  id                                         :integer         not null, primary key
#  financial_report_id                        :integer
#  operating_net_income                       :float
#  operating_depreciation                     :float
#  operating_amortization                     :float
#  operating_deferred_taxes                   :float
#  operating_non_cash_items                   :float
#  operating_changes_in_working_capital_items :float
#  operating_total                            :float
#  investing_capital_expenditures_items       :float
#  investing_other_items                      :float
#  investing_total                            :float
#  financing_items                            :float
#  financing_dividends                        :float
#  financing_stock                            :float
#  financing_debt                             :float
#  financing_total                            :float
#  misc_foreign_exchange                      :float
#  net_cash_change                            :float
#  net_cash_beginning                         :float
#  net_cash_ending                            :float
#  created_at                                 :datetime        not null
#  updated_at                                 :datetime        not null
#

require 'test_helper'

class CashFlowStatementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
