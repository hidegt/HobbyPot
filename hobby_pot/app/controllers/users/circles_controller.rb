class Users::CirclesController < ApplicationController
  def top
    @circles = Circle.all
  end

  def index
    @circles = Circle.page(params[:page]).reverse_order
    @category_list = Category.all
  end

  def show
    @circle = Circle.find(params[:id])
    @comment = CircleComment.new
    @join_circle = JoinCircle.new
    @circle_categories = @circle.categories
  end

  # def bookmarks
  #   @circles = current_user.fav_circles.includes(:user)
  # end
end
