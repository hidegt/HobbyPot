class Users::JoinCirclesController < ApplicationController
  def confirm
    @join_circle = current_user.join_circles.new(join_circle_params)
    @join_circle.user_id = current_user.id
  end

  def create
    @join_circle = current_user.join_circles.new(join_circle_params)
    if @join_circle.save!
      redirect_to :thanks
	  else
		  render root_path
	  end
  end

  def thanks
  end

  def index
    @join_circle = current_user.join_circles
  end

  private
  def join_circle_params
    params.require(:join_circle).permit(:user_id, :circle_id)
  end

end
