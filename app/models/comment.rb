class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true
  validates :content, length: {minium: 1, maximum: 40}
end
