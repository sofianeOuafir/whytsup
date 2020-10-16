class Price < ApplicationRecord
  belongs_to :day
  belongs_to :asset

  validates :asset_id, uniqueness: { scope: :day_id }
  validates :value, presence: true
  validates :change, presence: true
end
