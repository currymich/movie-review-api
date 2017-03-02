class User < ApplicationRecord
  validates :email, :username, presence: true, uniqueness: true
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :movies, through: :reviews
end
