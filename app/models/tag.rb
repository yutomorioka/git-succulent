class Tag < ApplicationRecord

  has_many :post_tags, dependent: :destroy
  has_many :post_plants, through: :post_tags
  
  def self.search_for(search)
    if search != '#'
      tag = Tag.where(name: search)
      tag[0].plants
    end
  end

end
