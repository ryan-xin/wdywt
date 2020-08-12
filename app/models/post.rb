class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  # Like association
  has_many :likes, dependent: :destroy
  # Save association
  has_and_belongs_to_many :saved_by_users, class_name: "User"
end
