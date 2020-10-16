class AddUniqueIndexToHeadlines < ActiveRecord::Migration[6.0]
  def change
    add_index :headlines, [:asset_id, :day_id], unique: true
  end
end
