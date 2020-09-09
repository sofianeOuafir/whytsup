class Following < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  validates :asset_id, uniqueness: { scope: :user_id }
end
