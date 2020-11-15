class Users::FavoritesController < ApplicationController
  before_action :set_circle
  
  def create
    favorite = current_user.favorites.build(circle_id: params[:circle_id])
    favorite.save!
    redirect_to circle_path(@circle)
  end

  def destroy
    current_user.favorites.find_by(circle_id: params[:circle_id]).destroy!
    redirect_to circle_path(@circle)
  end
  
  private
  def set_circle
    @circle = Circle.find(params[:circle_id])
  end
end
