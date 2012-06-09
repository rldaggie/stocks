class AddGrowthToCashFlowStatements < ActiveRecord::Migration
  def change
    CashFlowStatement.all_items_keys.each do |the_method|
      add_column :cash_flow_statements, "#{the_method}_growth".to_sym, :float
    end
  end
end
