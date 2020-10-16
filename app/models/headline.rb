class Headline < ApplicationRecord
  belongs_to :asset
  belongs_to :day
  has_many :prices, through: :asset
  has_many :news

  def price
    prices.find_by(day: day)
  end

  def title
    "Why #{asset.name} is #{price.value > 0 ? "up" : "down" } #{price.change}% today (#{day.date.strftime("%b #{day.date.day.ordinalize} %Y")})"
  end

  validates :asset_id, uniqueness: { scope: :day_id }
end
