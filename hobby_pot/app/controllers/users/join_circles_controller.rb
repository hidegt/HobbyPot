class Users::JoinCirclesController < ApplicationController
  def create
    @join_circle = current_user.join_circles.new(join_circle_params)
    if @join_circle.save!
      redirect_to :thanks
	  else
		  render root_path
	  end
  end


  def index
    @join_circle = current_user.join_circles
  end

  private
  def join_circle_params
    params.require(:join_circle).permit(:user_id, :circle_id)
  end

end
