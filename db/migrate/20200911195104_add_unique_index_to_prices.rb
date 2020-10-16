class AddUniqueIndexToPrices < ActiveRecord::Migration[6.0]
  def change
    add_index :prices, [:day_id, :asset_id], unique: true
  end
end
