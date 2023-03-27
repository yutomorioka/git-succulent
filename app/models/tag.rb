class Tag < ApplicationRecord

  has_many :post_tags, dependent: :destroy
  has_many :post_plants, through: :post_tags

  def self.search_for(tags)
    Tag.where(name: tags)
  end

end
