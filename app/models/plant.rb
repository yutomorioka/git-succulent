class Plant < ApplicationRecord

   has_many :post_plants, dependent: :destroy


   def self.search_for(search)
     Plant.where('name LIKE ?', '%'+search+'%')
   end

end
