class Asset < ApplicationRecord
  has_many :prices
  has_many :headlines

  def self.tesla
    find_by(code: "TSLA")
  end

  def self.amazon
    find_by(code: "AMZN")
  end
end
