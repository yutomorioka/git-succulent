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
    @post_plants = PostPlant.page(params[:page]).reverse_order
    @tags = Tag.all
  end

  def show
    @post_plant = PostPlant.find(params[:id])
    @tags = @post_plant.tags
    @comment = Comment.new
  end

  def edit
    @post_plant = PostPlant.find(params[:id])
  end

  def update
    @post_plant = PostPlant.find(params[:id])
    if @post_plant.update(post_plant_params)
      flash[:notice] = "情報の更新に成功しました！"
      redirect_to post_plant_path(@post_plant.id)
    else
      render :edit
    end
  end

  def destroy
    @post_plant = PostPlant.find(params[:id])
    @post_plant.destroy
    redirect_to request.referer
  end

  private

  def post_plant_params
    params.require(:post_plant).permit(:title, :explanation, :image, :area, :plant_id, tag_ids: [])
  end

end
