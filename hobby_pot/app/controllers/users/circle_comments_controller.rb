class Users::CircleCommentsController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    @comment = current_user.circle_comments.new(circle_comment_params)
    @comment.circle_id = @circle.id
    @comment.save
  end

  def destroy
    @circle = Circle.find(params[:circle_id])
    circle_comment = CircleComment.find_by(id: params[:id], circle_id: params[:circle_id])
    circle_comment.destroy
  end

  private
  def circle_comment_params
    params.require(:circle_comment).permit(:comment)
  end
end

