class Users::JoinCirclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_join
  
  def create
    join_circle = current_user.join_circles.build(circle_id: params[:circle_id])
    join_circle.save!
  end
  
  def destroy
    current_user.join_circles.find_by(circle_id: params[:circle_id]).destroy!
  end

  private
  def set_join
    @circle = Circle.find(params[:circle_id])
  end

end
