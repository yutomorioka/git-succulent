class Plant < ApplicationRecord

   has_many :post_plants, dependent: :destroy

   def self.search_for(content)
     Plant.where('name LIKE ?', '%'+content+'%')
   end

end
