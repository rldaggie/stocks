class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ticker

      t.timestamps
    end
    
    add_index :companies, :ticker
  end
end
