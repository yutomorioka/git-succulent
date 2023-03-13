# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    new_post_plant_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def user_state
    @user = User.find_by(email: params[:user][:email])
  return if !@user
    if @user.valid_password?(params[:user][:password]) && !@user.is_active
      redirect_to new_user_session_path
    end
  end

end
