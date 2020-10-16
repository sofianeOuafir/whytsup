class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.references :headline, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :link
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
