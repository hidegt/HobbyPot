class Leaders::CirclesController < ApplicationController

  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
  end

  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @circle.leader_id = current_leader.id
    @circle.save
    redirect_to leaders_circles_path
  end

  def edit
    @circle = Circle.find(params[:id])
  end

  def update
    @circle = Circle.find(params[:id])
    @circle.update
    redirect_to leaders_circle_path(@circle)
  end

  private
  def circle_params
    params.require(:circle).permit(:circle_title, :image, :circle_about,:date_and_time,:schedule,:prepare,:join_cost, :number_people,:circle_status,)
  end
end
