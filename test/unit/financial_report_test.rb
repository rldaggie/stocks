# == Schema Information
#
# Table name: financial_reports
#
#  id             :integer         not null, primary key
#  period_type    :string(255)
#  period_ending  :date
#  company_id     :integer
#  sec_filing_url :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

require 'test_helper'

class FinancialReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
