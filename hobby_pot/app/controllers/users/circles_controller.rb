class Users::CirclesController < ApplicationController
  def top
    @circles = Circle.all
  end

  def index
    if params[:category_id]
      @category_list = Category.all
      @list = Category.find(params[:category_id])
      @circles = @list.circles.page(params[:page]).reverse_order
    else
      @category_list = Category.all
      @circles = Circle.page(params[:page]).reverse_order
    end
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
