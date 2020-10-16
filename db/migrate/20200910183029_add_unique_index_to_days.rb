class AddUniqueIndexToDays < ActiveRecord::Migration[6.0]
  def change
    add_index :days, :date, unique: true
  end
end
