class Leaders::CirclesController < ApplicationController
  before_action :if_not_leader
  before_action :set_circle, only: [:edit, :update]

  def new
    @circle = Circle.new
  end

  def back
    @circle = Circle.new(session[:circle])
    @image = Image.find_or_initialize_by(temp_image_params)
    session.delete(:circle)
    render :new
  end

  def confirm
    @image = Image.create!(temp_image_params)
    session[:image_id] = @image.id
    @circle = Circle.find_or_initialize_by(id: params[:id])
    session[:circle] = circle_params
    @circle.assign_attributes(session[:circle])
    #session[:image] = @circle.image.id
    # debugger
  end

  def create
    @circle = Circle.new(session[:circle])
    # @circle.image_id = session[:image]
    @circle.leader_id = current_leader.id
    @circle.ima
    @circle.image_id = session[:image_id]
    category_list = params[:category_list].split(",")
    # debugger
    if @circle.save
      @circle.save_categories(category_list)
      session.delete(:circle)
      redirect_to circle_path(@circle.leader_id)
    else
      render :new
    end
  end

  def edit
    @category_list = @article.categories.pluck(:category_name).join(",")
  end

  def update
    category_list = params[:category_list].split(",")
    if @circle.update
     @article.save_categories(category_list)
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
    params.require(:circle).permit(:circle_title, :circle_about,:date_and_time,:schedule,:prepare,:join_cost, :number_people, :circle_status, :postcode,:prefecture_code,:address_city,:address_street,:address_building)
  end
  def if_not_leader
    redirect_to root_path unless current_leader
  end
  def set_circle
    @circle = Circle.find(params[:id])
  end

  def temp_image_params
    params.require(:circle).permit(:image)
  end
end