class Leaders::CirclesController < ApplicationController
  before_action :authenticate_leader!
  before_action :if_not_leader
  before_action :set_circle, only: [:show, :edit, :update]

  def new
    @circle = Circle.new
  end

  def create
    @circle = current_leader.circles.new(circle_params)
    category_list = params[:circle][:category_name].delete(" ").split(",")
    @circle.score_title = Language.get_data(circle_params[:circle_title])
    @circle.score_about = Language.get_data(circle_params[:circle_about])
    @circle.score_schedule = Language.get_data(circle_params[:schedule])
    @circle.score_prepare = Language.get_data(circle_params[:prepare])
    if @circle.score_title <= 0.3 || @circle.score_about <= 0.3 || @circle.score_schedule <= 0.3 || @circle.score_prepare <= 0.3
      @circle.save
      @circle.update(circle_status: false)
      flash[:notice] = "不適切な言葉があるため非公開設定にしました"
      redirect_to leaders_circle_path(@circle)
    elsif @circle.save
      @circle.save_categories(category_list)
      redirect_to circle_path(@circle)
    else
      render :new
    end
  end

  def show
    if @circle.leader != current_leader
      flash[:notice] = "アクセスできません"
      redirect_to root_path
    end
    @circle_categories = @circle.categories
  end

  def edit
    if @circle.leader != current_leader
      flash[:notice] = "アクセスできません"
      redirect_to root_path
    end
    @category_list = @circle.categories.pluck(:category_name).join(",")
  end

  def update
    category_list = params[:circle][:category_name].split(",")
    @circle.score_title = Language.get_data(circle_params[:circle_title])
    @circle.score_about = Language.get_data(circle_params[:circle_about])
    @circle.score_schedule = Language.get_data(circle_params[:schedule])
    @circle.score_prepare = Language.get_data(circle_params[:prepare])
    if @circle.score_title <= 0.3 || @circle.score_about <= 0.3 || @circle.score_schedule <= 0.3
      @circle.update(circle_params)
      @circle.update(circle_status: false)
      flash[:notice] = "不適切な言葉があるため非公開設定にしました"
      redirect_to leaders_circle_path(@circle)
    elsif @circle.update(circle_params)
     @circle.save_categories(category_list)
     redirect_to circle_path(@circle)
    else
     render :edit
    end
  end

  private
  def circle_params
    params.require(:circle).permit(:circle_title,:image, :circle_about,:start_time,:schedule,:prepare,:join_cost, :number_people, :circle_status, :postcode,:prefecture_code,:address_city,:address_street,:address_building,:score_title,:score_about,:score_schedule,:score_prepare)
  end

  def if_not_leader
    redirect_to root_path unless current_leader
  end

  def set_circle
    @circle = Circle.find(params[:id])
  end
end
