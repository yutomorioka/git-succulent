class Admin::PostPlantsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post_plants = @user.post_plants
  end

  def show
    @post_plant = PostPlant.find(params[:id])
  end

  def edit
  end
end
