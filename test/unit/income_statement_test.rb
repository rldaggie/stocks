# == Schema Information
#
# Table name: income_statements
#
#  id                                   :integer         not null, primary key
#  financial_report_id                  :integer
#  revenue                              :float
#  revenue_other                        :float
#  revenue_total                        :float
#  cost_of_revenue                      :float
#  income_gross                         :float
#  op_expense_selling_general_admin     :float
#  op_expense_research_development      :float
#  op_expense_depreciation_amortization :float
#  op_expense_interest                  :float
#  op_expense_unusual                   :float
#  op_expense_other                     :float
#  income_operating                     :float
#  non_op_expense_interest              :float
#  non_op_expense_asset_sale            :float
#  non_op_expense_other                 :float
#  income_before_tax                    :float
#  tax_income                           :float
#  income_after_tax                     :float
#  misc_expense_minority_interest       :float
#  misc_expense_equity_in_affiliates    :float
#  misc_expense_us_gaap_adjustment      :float
#  income_before_extra_items            :float
#  extra_items                          :float
#  income_net                           :float
#  adjustment_to_net_income             :float
#  created_at                           :datetime        not null
#  updated_at                           :datetime        not null
#

require 'test_helper'

class IncomeStatementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
