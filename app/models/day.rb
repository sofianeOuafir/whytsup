class Day < ApplicationRecord
  has_many :headlines
  has_many :prices

  validates :date, uniqueness: true

  def self.today
    find_by(date: Date.today)
  end
end
