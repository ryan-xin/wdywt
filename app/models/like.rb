class Like < ApplicationRecord
  # Post association
  belongs_to :post
  # User association
  belongs_to :user
end
