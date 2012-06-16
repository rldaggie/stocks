class AddAssetQualityRatioToBalanceSheets < ActiveRecord::Migration
  def change
    add_column :balance_sheets, :asset_quality_ratio, :float
  end
end
