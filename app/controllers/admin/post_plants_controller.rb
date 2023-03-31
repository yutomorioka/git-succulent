class Admin::PostPlantsController < ApplicationController
  def index
    @post_plants = PostPlant.all
  end

  def show
    @post_plant = PostPlant.find(params[:id])
  end

  def edit
  end
end
