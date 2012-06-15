# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120615174151) do

  create_table "balance_sheets", :force => true do |t|
    t.integer  "financial_report_id"
    t.float    "assets_current_cash_and_short_term_investments"
    t.float    "assets_current_receivables"
    t.float    "assets_current_inventory"
    t.float    "assets_current_prepaid_expenses"
    t.float    "assets_current_other"
    t.float    "assets_current_total"
    t.float    "assets_other_property_plant_equipment"
    t.float    "assets_other_goodwill"
    t.float    "assets_other_intangibles"
    t.float    "assets_other_long_term_investments"
    t.float    "assets_other_receivables"
    t.float    "assets_other_misc"
    t.float    "assets_other_total"
    t.float    "assets_total"
    t.float    "liabilities_current_accounts_payable"
    t.float    "liabilities_current_payable_accrued"
    t.float    "liabilities_current_accrued_expenses"
    t.float    "liabilities_current_notes_payable"
    t.float    "liabilities_current_leases"
    t.float    "liabilities_current_other"
    t.float    "liabilities_current_total"
    t.float    "liabilities_other_debt"
    t.float    "liabilities_other_deferred_income_tax"
    t.float    "liabilities_other_minority_interest"
    t.float    "liabilities_other_misc"
    t.float    "liabilities_total"
    t.float    "equity_preferred_stock_redeemable"
    t.float    "equity_preferred_stock_non_redeemable"
    t.float    "equity_common_stock"
    t.float    "equity_additional_paid_in_capital"
    t.float    "equity_retained_earnings"
    t.float    "equity_treasury_stock"
    t.float    "equity_esop_debt_guarantee"
    t.float    "equity_unrealized_gain"
    t.float    "equity_other"
    t.float    "equity_total"
    t.float    "liabilities_and_equity_total"
    t.float    "shares_common_outstanding"
    t.float    "shares_preferred_outstanding"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.float    "assets_current_cash_and_short_term_investments_growth"
    t.float    "assets_current_receivables_growth"
    t.float    "assets_current_inventory_growth"
    t.float    "assets_current_prepaid_expenses_growth"
    t.float    "assets_current_other_growth"
    t.float    "assets_current_total_growth"
    t.float    "assets_other_property_plant_equipment_growth"
    t.float    "assets_other_goodwill_growth"
    t.float    "assets_other_intangibles_growth"
    t.float    "assets_other_long_term_investments_growth"
    t.float    "assets_other_receivables_growth"
    t.float    "assets_other_misc_growth"
    t.float    "assets_other_total_growth"
    t.float    "assets_total_growth"
    t.float    "liabilities_current_accounts_payable_growth"
    t.float    "liabilities_current_payable_accrued_growth"
    t.float    "liabilities_current_accrued_expenses_growth"
    t.float    "liabilities_current_notes_payable_growth"
    t.float    "liabilities_current_leases_growth"
    t.float    "liabilities_current_other_growth"
    t.float    "liabilities_current_total_growth"
    t.float    "liabilities_other_debt_growth"
    t.float    "liabilities_other_deferred_income_tax_growth"
    t.float    "liabilities_other_minority_interest_growth"
    t.float    "liabilities_other_misc_growth"
    t.float    "liabilities_total_growth"
    t.float    "equity_preferred_stock_redeemable_growth"
    t.float    "equity_preferred_stock_non_redeemable_growth"
    t.float    "equity_common_stock_growth"
    t.float    "equity_additional_paid_in_capital_growth"
    t.float    "equity_retained_earnings_growth"
    t.float    "equity_treasury_stock_growth"
    t.float    "equity_esop_debt_guarantee_growth"
    t.float    "equity_unrealized_gain_growth"
    t.float    "equity_other_growth"
    t.float    "equity_total_growth"
    t.float    "liabilities_and_equity_total_growth"
    t.float    "shares_common_outstanding_growth"
    t.float    "shares_preferred_outstanding_growth"
  end

  add_index "balance_sheets", ["financial_report_id"], :name => "index_balance_sheets_on_financial_report_id"

  create_table "cash_flow_statements", :force => true do |t|
    t.integer  "financial_report_id"
    t.float    "operating_net_income"
    t.float    "operating_depreciation"
    t.float    "operating_amortization"
    t.float    "operating_deferred_taxes"
    t.float    "operating_non_cash_items"
    t.float    "operating_changes_in_working_capital_items"
    t.float    "operating_total"
    t.float    "investing_capital_expenditures_items"
    t.float    "investing_other_items"
    t.float    "investing_total"
    t.float    "financing_items"
    t.float    "financing_dividends"
    t.float    "financing_stock"
    t.float    "financing_debt"
    t.float    "financing_total"
    t.float    "misc_foreign_exchange"
    t.float    "net_cash_change"
    t.float    "net_cash_beginning"
    t.float    "net_cash_ending"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.float    "operating_net_income_growth"
    t.float    "operating_depreciation_growth"
    t.float    "operating_amortization_growth"
    t.float    "operating_deferred_taxes_growth"
    t.float    "operating_non_cash_items_growth"
    t.float    "operating_changes_in_working_capital_items_growth"
    t.float    "operating_total_growth"
    t.float    "investing_capital_expenditures_items_growth"
    t.float    "investing_other_items_growth"
    t.float    "investing_total_growth"
    t.float    "financing_items_growth"
    t.float    "financing_dividends_growth"
    t.float    "financing_stock_growth"
    t.float    "financing_debt_growth"
    t.float    "financing_total_growth"
    t.float    "misc_foreign_exchange_growth"
    t.float    "net_cash_change_growth"
    t.float    "net_cash_beginning_growth"
    t.float    "net_cash_ending_growth"
  end

  add_index "cash_flow_statements", ["financial_report_id"], :name => "index_cash_flow_statements_on_financial_report_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "ticker"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "companies", ["ticker"], :name => "index_companies_on_ticker"

  create_table "financial_reports", :force => true do |t|
    t.string   "period_type"
    t.date     "period_ending"
    t.integer  "company_id"
    t.string   "sec_filing_url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.float    "inventory_turnover"
  end

  add_index "financial_reports", ["company_id"], :name => "index_financial_reports_on_company_id"

  create_table "income_statements", :force => true do |t|
    t.integer  "financial_report_id"
    t.float    "revenue"
    t.float    "revenue_other"
    t.float    "revenue_total"
    t.float    "cost_of_revenue"
    t.float    "income_gross"
    t.float    "op_expense_selling_general_admin"
    t.float    "op_expense_research_development"
    t.float    "op_expense_depreciation_amortization"
    t.float    "op_expense_interest"
    t.float    "op_expense_unusual"
    t.float    "op_expense_other"
    t.float    "income_operating"
    t.float    "non_op_expense_interest"
    t.float    "non_op_expense_asset_sale"
    t.float    "non_op_expense_other"
    t.float    "income_before_tax"
    t.float    "tax_income"
    t.float    "income_after_tax"
    t.float    "misc_expense_minority_interest"
    t.float    "misc_expense_equity_in_affiliates"
    t.float    "misc_expense_us_gaap_adjustment"
    t.float    "income_before_extra_items"
    t.float    "extra_items"
    t.float    "income_net"
    t.float    "adjustment_to_net_income"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.float    "revenue_growth"
    t.float    "revenue_other_growth"
    t.float    "revenue_total_growth"
    t.float    "cost_of_revenue_growth"
    t.float    "income_gross_growth"
    t.float    "op_expense_selling_general_admin_growth"
    t.float    "op_expense_research_development_growth"
    t.float    "op_expense_depreciation_amortization_growth"
    t.float    "op_expense_interest_growth"
    t.float    "op_expense_unusual_growth"
    t.float    "op_expense_other_growth"
    t.float    "income_operating_growth"
    t.float    "non_op_expense_interest_growth"
    t.float    "non_op_expense_asset_sale_growth"
    t.float    "non_op_expense_other_growth"
    t.float    "income_before_tax_growth"
    t.float    "tax_income_growth"
    t.float    "income_after_tax_growth"
    t.float    "misc_expense_minority_interest_growth"
    t.float    "misc_expense_equity_in_affiliates_growth"
    t.float    "misc_expense_us_gaap_adjustment_growth"
    t.float    "income_before_extra_items_growth"
    t.float    "extra_items_growth"
    t.float    "income_net_growth"
    t.float    "adjustment_to_net_income_growth"
  end

  add_index "income_statements", ["financial_report_id"], :name => "index_income_statements_on_financial_report_id"

end
