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
    redirect_to circles_path
  end

  def edit
  end

  def update
  end

  private
  def circle_params
    params.require(:circle).permit(:circle_title, :image, :circle_about,:date_and_time,:schedule,:prepare,:join_cost, :number_people,:circle_status,)
  end
end
