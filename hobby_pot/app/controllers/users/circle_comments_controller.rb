class Users::CircleCommentsController < ApplicationController
  def create
    circle = Circle.find(params[:circle_id])
    comment = current_user.circle_comments.new(circle_comment_params)
    comment.circle_id = circle.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    CircleComment.find_by(id: params[:id], circle_id: params[:circle_id]).destroy
    redirect_to request.referer
  end

  private
  def circle_comment_params
    params.require(:circle_comment).permit(:comment)
  end
end

