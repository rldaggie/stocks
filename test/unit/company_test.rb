# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  ticker     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  cik_number :integer
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
