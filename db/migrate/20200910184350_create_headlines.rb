class CreateHeadlines < ActiveRecord::Migration[6.0]
  def change
    create_table :headlines do |t|
      t.references :asset, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
