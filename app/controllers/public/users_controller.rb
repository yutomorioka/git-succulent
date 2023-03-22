class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_plant_id)
    @favorites = PostPlant.find(favorites)
  end

  def withdraw
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
