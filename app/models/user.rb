class User < ApplicationRecord
  has_many :posts
  has_many :comments
  # Signup
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # Like association
  has_many :likes, dependent: :destroy
  # Save association
  has_and_belongs_to_many :saved_posts, class_name: "Post"
  # Follow association
  has_many :following_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy  
  has_many :following, through: "following_relationships", source: "followed"
  has_many :followers, through: "followed_relationships", source: "follower"
end
