class Public::PostPlantsController < ApplicationController
  def new
    @post_plant = PostPlant.new
  end

  def create
    @post_plant.genre_id = params[:genre][:name]
    @post_plant = PostPlant.new(post_plant_params)
    @post_plant.user_id = current_user.id
    if @post_plant.save
      redirect_to post_plants_path
    else
      render :new
    end
  end

  def index
    @post_plants = PostPlant.all
  end

  def show
  end

  def edit
  end

  private

  def post_plant_params
    params.require(:post_plant).permit(:title, :explanation, :image, :plant_id)
  end

end
