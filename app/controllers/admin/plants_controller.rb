class Admin::PlantsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @plant = Plant.new
    @plants = Plant.all
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to admin_plants_path, notice: "登録に成功しました。"
    else
      @plants = Plant.all
      render :index
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      redirect_to admin_plants_path, notice: "編集に成功しました。"
    else
      render :edit
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :genre)
  end

end