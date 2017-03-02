class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :reviews
  has_many :movies, through: :reviews
end
