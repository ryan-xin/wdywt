class Comment < ApplicationRecord
  # Post association
  belongs_to :post, optional: true
  # User association
  belongs_to :user, optional: true
  validates :content, presence: true
end
