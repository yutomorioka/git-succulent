class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_plant
  
  validates :comment, presence: true, length: { in: 1..200 }
  
end
