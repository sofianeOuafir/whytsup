class User < ApplicationRecord  
  has_secure_password

  has_many :followings
  has_many :assets, through: :followings
  has_many :headlines, through: :assets

  validates :email, uniqueness: true
  validates :name, presence: true
end
