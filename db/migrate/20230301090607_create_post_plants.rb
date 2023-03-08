class CreatePostPlants < ActiveRecord::Migration[6.1]
  def change
    create_table :post_plants do |t|
      
      t.string :image_id
      t.integer :user_id, null: false
      t.integer :plant_id, null: false
      t.string :title, null: false
      t.text :explanation, null: false
      t.integer :area, null: false, default: 0

      t.timestamps
    end
  end
end
