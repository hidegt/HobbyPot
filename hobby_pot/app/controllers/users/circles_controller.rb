class Users::CirclesController < ApplicationController
  def top
    @circles = Circle.all
  end
  
  def index
    @circles = Circle.page(params[:page]).reverse_order
  end
  
  def show
    @circle = Circle.find(params[:id])
    @comment = CircleComment.new
    @join_circle = Join.new
  end
  
  def bookmarks
    @circles = current_user.fav_circles.includes(:user)
  end
end
