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

ActiveRecord::Schema.define(:version => 20120521031053) do

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
