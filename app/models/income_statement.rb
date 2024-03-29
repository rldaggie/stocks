# == Schema Information
#
# Table name: income_statements
#
#  id                                          :integer         not null, primary key
#  financial_report_id                         :integer
#  revenue                                     :float
#  revenue_other                               :float
#  revenue_total                               :float
#  cost_of_revenue                             :float
#  income_gross                                :float
#  op_expense_selling_general_admin            :float
#  op_expense_research_development             :float
#  op_expense_depreciation_amortization        :float
#  op_expense_interest                         :float
#  op_expense_unusual                          :float
#  op_expense_other                            :float
#  income_operating                            :float
#  non_op_expense_interest                     :float
#  non_op_expense_asset_sale                   :float
#  non_op_expense_other                        :float
#  income_before_tax                           :float
#  tax_income                                  :float
#  income_after_tax                            :float
#  misc_expense_minority_interest              :float
#  misc_expense_equity_in_affiliates           :float
#  misc_expense_us_gaap_adjustment             :float
#  income_before_extra_items                   :float
#  extra_items                                 :float
#  income_net                                  :float
#  adjustment_to_net_income                    :float
#  created_at                                  :datetime        not null
#  updated_at                                  :datetime        not null
#  revenue_growth                              :float
#  revenue_other_growth                        :float
#  revenue_total_growth                        :float
#  cost_of_revenue_growth                      :float
#  income_gross_growth                         :float
#  op_expense_selling_general_admin_growth     :float
#  op_expense_research_development_growth      :float
#  op_expense_depreciation_amortization_growth :float
#  op_expense_interest_growth                  :float
#  op_expense_unusual_growth                   :float
#  op_expense_other_growth                     :float
#  income_operating_growth                     :float
#  non_op_expense_interest_growth              :float
#  non_op_expense_asset_sale_growth            :float
#  non_op_expense_other_growth                 :float
#  income_before_tax_growth                    :float
#  tax_income_growth                           :float
#  income_after_tax_growth                     :float
#  misc_expense_minority_interest_growth       :float
#  misc_expense_equity_in_affiliates_growth    :float
#  misc_expense_us_gaap_adjustment_growth      :float
#  income_before_extra_items_growth            :float
#  extra_items_growth                          :float
#  income_net_growth                           :float
#  adjustment_to_net_income_growth             :float
#  gross_margin                                :float
#

class IncomeStatement < ActiveRecord::Base
  
  include Extensions::FinancialStatement
  
  attr_accessible :financial_report_id, :revenue, :revenue_other, :revenue_total, :cost_of_revenue, :income_gross, :op_expense_selling_general_admin, :op_expense_research_development, :op_expense_depreciation_amortization, :op_expense_interest, :op_expense_unusual, :op_expense_other, :income_operating, :non_op_expense_interest, :non_op_expense_asset_sale, :non_op_expense_other, :income_before_tax, :tax_income, :income_after_tax, :misc_expense_minority_interest, :misc_expense_equity_in_affiliates, :misc_expense_us_gaap_adjustment, :income_before_extra_items, :extra_items, :income_net, :adjustment_to_net_income
  
  class << self
    def all_items_hash
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
  
  def calculate_gross_margin!
    return nil unless FinancialReport.is_divisible?(revenue_total, cost_of_revenue)
    self.gross_margin = (revenue_total - cost_of_revenue) / revenue_total * 100
    save
  end
end
