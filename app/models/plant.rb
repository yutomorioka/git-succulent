class Plant < ApplicationRecord

   has_many :post_plants, dependent: :destroy

end
