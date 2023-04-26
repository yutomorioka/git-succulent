class Public::PostPlantsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post_plant = PostPlant.new
  end

  def create
    @post_plant = PostPlant.new(post_plant_params)
    @post_plant.user_id = current_user.id
    if @post_plant.save
      redirect_to post_plants_path, notice: "投稿に成功しました。"
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

  private

  def post_plant_params
    params.require(:post_plant).permit(:title, :explanation, :image, :area, :plant_id, tag_ids: [])
  end

end
