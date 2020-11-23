class Users::FavoritesController < ApplicationController
  before_action :set_circle
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.build(circle_id: params[:circle_id])
    favorite.save!
  end

  def destroy
    current_user.favorites.find_by(circle_id: params[:circle_id]).destroy!
  end

  private
  def set_circle
    @circle = Circle.find(params[:circle_id])
  end
end
