class AddUniqueIndexToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_index :followings, [:asset_id, :user_id], unique: true
  end
end
