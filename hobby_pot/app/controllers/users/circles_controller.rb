class Users::CirclesController < ApplicationController
  def top
    @circles = Circle.where(circle_status: true).or(Circle.where(:start_time => Date.today)).sample(4)
  end

  def index
    if params[:category_id]
      @category_list = Category.all
      @list = Category.find(params[:category_id])
      @circles = @list.circles.where(circle_status: true).or(@list.circles.where(:start_time => Date.today)).page(params[:page]).reverse_order
    else
      @category_list = Category.all
      @circles = Circle.where(circle_status: true).or(Circle.where(:start_time => Date.today)).page(params[:page]).reverse_order
    end
  end

  def show
    @circle = Circle.find(params[:id])
    @comment = CircleComment.new
    @join_circle = JoinCircle.new
    @circle_categories = @circle.categories
  end

end
