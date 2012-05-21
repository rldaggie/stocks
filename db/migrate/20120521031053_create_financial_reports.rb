class CreateFinancialReports < ActiveRecord::Migration
  def change
    create_table :financial_reports do |t|
      t.string :period_type
      t.date :period_ending
      t.integer :company_id
      t.string :sec_filing_url

      t.timestamps
    end
    
    add_index :financial_reports, :company_id
  end
end
