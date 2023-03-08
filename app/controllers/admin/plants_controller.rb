class Admin::PlantsController < ApplicationController
  def index
    @plant = Plant.new
    @plants = Plant.all
  end
  
  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to admin_plants_path
    else
      @plant= Plant.all
      render :index
    end
  end  

  def edit
  end
  
  private
  
  def plant_params
    params.require(:plant).permit(:name, :genre)
  end
  
end
