class Users::CirclesController < ApplicationController
  def top
    @circles = Circle.all
  end
  
  def index
    @circles = Circle.page(params[:page]).reverse_order
  end
  
  def show
    @circle = Circle.find(params[:id])
  end
end
