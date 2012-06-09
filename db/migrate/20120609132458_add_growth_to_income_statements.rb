class AddGrowthToIncomeStatements < ActiveRecord::Migration
  def change
    IncomeStatement.all_items_keys.each do |the_method|
      add_column :income_statements, "#{the_method}_growth".to_sym, :float
    end
  end
end
