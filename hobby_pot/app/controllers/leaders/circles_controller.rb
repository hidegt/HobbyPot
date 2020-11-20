class Leaders::CirclesController < ApplicationController
  before_action :if_not_leader
  before_action :set_circle, only: [:edit, :update]

  def new
    @circle = Circle.new
  end

  def back
    @circle = Circle.new(session[:circle])
    session.delete(:circle)
    render :new
  end

  def confirm
    @circle = Circle.find_or_initialize_by(id: params[:id])
    session[:circle] = circle_params
    @circle.image_id = session[:image]
    @circle.assign_attributes(session[:circle])
    # @circle = Circle.new(circle_params)
    # session[:circle] = @circle
    debugger
  end

  def create
    @circle = Circle.new(session[:circle])
    @circle.image = session[:image]
    @circle.leader_id = current_leader.id
    debugger
    if @circle.save
      session.delete(:circle)
      redirect_to circle_path(@circle.leader_id)
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

  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy
    redirect_to root_path
  end

  private
  def circle_params
    params.require(:circle).permit(:circle_title, :image, :circle_about,:date_and_time,:schedule,:prepare,:join_cost, :number_people, :circle_status, :postcode,:prefecture_code,:address_city,:address_street,:address_building)
  end
  def if_not_leader
    redirect_to root_path unless current_leader
  end
  def set_circle
    @circle = Circle.find(params[:id])
  end
end