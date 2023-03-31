class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[id])
  end
  
  def update
    
  end

  def edit
  end
  
  private
  
  def user_params
    params.require(:customer).permit(:name, :email, :is_active)
  end
  
end