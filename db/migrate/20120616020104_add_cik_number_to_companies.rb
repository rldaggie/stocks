class AddCikNumberToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :cik_number, :integer
  end
end
