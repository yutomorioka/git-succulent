class Admin::PostPlantsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post_plants = @user.post_plants
  end

  def show
    @post_plant = PostPlant.find(params[:id])
    @user = @post_plant.user
    @tags = @post_plant.tags
  end

  def edit
    @post_plant = PostPlant.find(params[:id])
    @user = @post_plant.user
    @tags = @post_plant.tags
  end
  
  def destroy
    @post_plant = PostPlant.find(params[:id])
    @post_plant.destroy
    redirect_to request.referer
  end
  
end
