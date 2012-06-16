class AddGrossMarginToIncomeStatements < ActiveRecord::Migration
  def change
    add_column :income_statements, :gross_margin, :float
  end
end
