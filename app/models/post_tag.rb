class PostTag < ApplicationRecord
    
    belongs_to :post_plant
    belongs_to :tag
    
end
