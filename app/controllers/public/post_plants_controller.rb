class Public::PostPlantsController < ApplicationController
  def new
    @post_plant = PostPlant.new
  end

  def create
    @post_plant = PostPlant.new(post_plant_params)
    @post_plant.user_id = current_user.id

    if @post_plant.save!
      redirect_to post_plants_path
    else
      render :new
    end
  end

  def index
    @post_plants = PostPlant.all
    @tags = Tag.all
  end

  def show
    @post_plant = PostPlant.find(params[:id])
    @tags = @post_plant.tags
    @comment = Comment.new
  end

  def edit
  end

  private

  def post_plant_params
    params.require(:post_plant).permit(:title, :explanation, :area, :plant_id, tag_ids: [])
  end

end
