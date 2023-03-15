class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_plant
  validates_uniqueness_of :post_plant_id, scope: :user_id
end
