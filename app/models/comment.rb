class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_plant
  
  validates :genre, presence: true, length: { in: 1..200 }
  
end
