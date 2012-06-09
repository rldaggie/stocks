class AddGrowthToBalanceSheets < ActiveRecord::Migration
  def change
    BalanceSheet.all_items_keys.each do |the_method|
      add_column :balance_sheets, "#{the_method}_growth".to_sym, :float
    end
  end
end
