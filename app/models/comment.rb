class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_plant
  
end
