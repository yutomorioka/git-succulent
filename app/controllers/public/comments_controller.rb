class Public::CommentsController < ApplicationController

  def create
    post_plant = PostPlant.find(params[:post_plant_id])
    comment = current_user.comments.new(comment_params)
    comment.post_plant_id = post_plant.id
    comment.save
    redirect_to post_plant_path(post_plant)
  end
  
  def destroy
    Comment.find_by(id: params[:id], post_plant_id: params[:post_plant_id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
