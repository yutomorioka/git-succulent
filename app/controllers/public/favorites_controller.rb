class Public::FavoritesController < ApplicationController
  
  def index
    @favorites = Favorite.all
  end
  
  def create
    post_plant = PostPlant.find(params[:post_plant_id])
    favorite = current_user.favorites.new(post_plant_id: post_plant.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    post_plant = PostPlant.find(params[:post_plant_id])
    favorite = current_user.favorites.find_by(post_plant_id: post_plant.id)
    favorite.destroy
    redirect_to request.referer
  end
  
end
