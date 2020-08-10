class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_secure_password
  validates :name, length: {minium: 4, maximum: 20}
  validates :email, presence: true, uniqueness: true
  has_many :likes, dependent: :destroy
end
