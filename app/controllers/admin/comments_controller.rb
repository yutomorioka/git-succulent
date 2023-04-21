class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    Comment.find_by(id: params[:id], post_plant_id: params[:post_plant_id]).destroy
    redirect_to request.referer
  end
end
