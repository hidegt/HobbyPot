class Leaders::FavoritesController < ApplicationController
  before_action :set_circle
  
  def create
    favorite = current_leader.favorites.build(circle_id: params[:circle_id])
    favorite.save!
    redirect_to leaders_circle_path(@circle)
  end

  def destroy
    current_leader.favorites.find_by(circle_id: params[:circle_id]).destroy!
    redirect_to leaders_circle_path(@circle)
  end
  
  private
  def set_circle
    @circle = Circle.find(params[:circle_id])
  end
end
