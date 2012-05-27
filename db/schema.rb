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

ActiveRecord::Schema.define(:version => 20120525011722) do

  create_table "cash_flow_statements", :force => true do |t|
    t.integer  "financial_report_id"
    t.float    "operating_net_income"
    t.float    "operating_depreciation"
    t.float    "operating_amortization"
    t.float    "operating_deferred_taxes"
    t.float    "operating_non_cash"
    t.float    "operating_changes_in_working_capital"
    t.float    "operating_total"
    t.float    "investing_capital_expenditures"
    t.float    "investing_other"
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
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
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
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "financial_reports", ["company_id"], :name => "index_financial_reports_on_company_id"

end
