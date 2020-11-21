class Leaders::CirclesController < ApplicationController
  before_action :if_not_leader
  before_action :set_circle, only: [:edit, :update]

  def new
    @circle = Circle.new
  end

  def create
    @circle = current_leader.circles.new(circle_params)
    category_list = params[:circle][:category_name].delete(" ").split(",")
    if @circle.save
      @circle.save_categories(category_list)
      redirect_to circle_path(@circle)
    else
      render :new
    end
  end

  def edit
    @category_list = @circle.categories.pluck(:category_name).join(",")
  end

  def update
    category_list = params[:circle][:category_name].split(",")
    if @circle.update(circle_params)
     @circle.save_categories(category_list)
     redirect_to leaders_circle_path(@circle)
    else
     render :edit
    end
  end

  private
  def circle_params
    params.require(:circle).permit(:circle_title,:image, :circle_about,:date_and_time,:schedule,:prepare,:join_cost, :number_people, :circle_status, :postcode,:prefecture_code,:address_city,:address_street,:address_building)
  end

  def if_not_leader
    redirect_to root_path unless current_leader
  end
  def set_circle
    @circle = Circle.find(params[:id])
  end
end