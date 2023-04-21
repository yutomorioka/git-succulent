class Plant < ApplicationRecord
   validates :name, presence: true, uniqueness: true
   validates :genre, presence: true, uniqueness: true

   has_many :post_plants, dependent: :destroy


   def self.search_for(search)
     Plant.where('name LIKE ?', '%'+search+'%')
   end

end
