class Leaders::CirclesController < ApplicationController
  before_action :if_not_leader
  before_action :set_circle, only: [:show, :edit, :update]
  
  def index
    @circles = Circle.all
  end

  def show
  end

  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @circle.leader_id = current_leader.id
    if @circle.save
      redirect_to leaders_circles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @circle.update
     redirect_to leaders_circle_path(@circle)
    else
     render :edit
    end
  end

  private
  def circle_params
    params.require(:circle).permit(:circle_title, :image, :circle_about,:date_and_time,:schedule,:prepare,:join_cost, :number_people, :circle_status,)
  end
  def if_not_leader
    redirect_to root_path unless current_leader
  end
  def set_circle
    @circle = Circle.find(params[:id])
  end
end
