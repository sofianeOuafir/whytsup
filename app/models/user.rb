class User < ApplicationRecord
  has_secure_password

  has_many :followings
  has_many :assets, through: :followings
end
