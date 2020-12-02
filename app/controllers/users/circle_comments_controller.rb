class Users::CircleCommentsController < ApplicationController
  before_action :set_circle
  before_action :authenticate_user!
  def create
    @comment = current_user.circle_comments.new(circle_comment_params)
    @comment.circle_id = @circle.id
    @comment.score_comment = Language.get_data(circle_comment_params[:comment])
    if @comment.score_comment <= 0.3
      flash[:notice] = "不適切な言葉があるためコメントできません"
      redirect_to request.referer
    else
      @comment.save
    end
  end

  def destroy
    circle_comment = CircleComment.find_by(id: params[:id], circle_id: params[:circle_id])
    circle_comment.destroy
  end

  private
  def circle_comment_params
    params.require(:circle_comment).permit(:comment)
  end
  def set_circle
    @circle = Circle.find(params[:circle_id])
  end
end

