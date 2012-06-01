class IncomeStatement < ActiveRecord::Base
  
  include Extensions::FinancialStatement
  
  attr_accessible :financial_report_id, :revenue, :revenue_other, :revenue_total, :cost_of_revenue, :income_gross, :op_expense_selling_general_admin, :op_expense_research_development, :op_expense_depreciation_amortization, :op_expense_interest, :op_expense_unusual, :op_expense_other, :income_operating, :non_op_expense_interest, :non_op_expense_asset_sale, :non_op_expense_other, :income_before_tax, :tax_income, :income_after_tax, :misc_expense_minority_interest, :misc_expense_equity_in_affiliates, :misc_expense_us_gaap_adjustment, :income_before_extra_items, :extra_items, :income_net, :adjustment_to_net_income
  
  class << self
    def all_items
      [
        {
          :group_key => 'revenues',
          :items => [
            :revenue,
            :revenue_other,
            :revenue_total
          ]
        },
        {
          :group_key => 'cost_of_revenue',
          :items => [
            :cost_of_revenue,
            :income_gross
          ]
        },
        {
          :group_key => 'operating_expenses',
          :items => [
            :op_expense_selling_general_admin,
            :op_expense_research_development,
            :op_expense_depreciation_amortization,
            :op_expense_interest,
            :op_expense_unusual,
            :op_expense_other,
            :income_operating
          ]
        },
        {
          :group_key => 'non_operating_expenses',
          :items => [
            :non_op_expense_interest,
            :non_op_expense_asset_sale,
            :non_op_expense_other,
            :income_before_tax
          ]
        },
        {
          :group_key => 'taxes',
          :items => [
            :tax_income,
            :income_after_tax
          ]
        },
        {
          :group_key => 'misc_expenses',
          :items => [
            :misc_expense_minority_interest,
            :misc_expense_equity_in_affiliates,
            :misc_expense_us_gaap_adjustment,
            :income_before_extra_items
          ]
        },
        {
          :group_key => 'extra_expenses',
          :items => [
            :extra_items,
            :income_net
          ]
        },
        {
          :group_key => 'income_adjustment',
          :items => [
            :adjustment_to_net_income
          ]
        }
      ]
    end
  end
end