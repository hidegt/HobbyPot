class Users::CirclesController < ApplicationController
  # require 'date'
  def top
    @circles = Circle.where(circle_status: true).where('start_time >= ?', Time.current.beginning_of_day).sample(4)
  end

  def index
    if params[:category_id]
      @category_list = Category.all.sample(10)
      @list = Category.find(params[:category_id])
      @circles = @list.circles.where(circle_status: true).where('start_time >= ?', Time.current.beginning_of_day).page(params[:page]).per(15).reverse_order
    else
      @category_list = Category.all.sample(10)
      @circles = Circle.where(circle_status: true).where('start_time >= ?', Time.current.beginning_of_day).page(params[:page]).per(15).reverse_order
    end
  end

  def show
    @circle = Circle.find(params[:id])
    @comment = CircleComment.new
    @join_circle = JoinCircle.new
    @circle_categories = @circle.categories
  end

  def join_circles
    @circle = Circle.find(params[:id])
  end

end
