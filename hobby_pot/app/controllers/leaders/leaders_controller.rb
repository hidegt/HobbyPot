class Leaders::LeadersController < ApplicationController
  before_action :if_not_current_leader, only: [:edit, :update, :unsubscribe, :withdraw]
  before_action :set_leader, only: [:update, :unsubscribe, :withdraw]
  def show
    @leader = Leader.find(params[:id])
    @circles = @leader.circles
  end

  def edit
  end

  def update
    @leader.update(leader_params)
    redirect_to leaders_leader_path(@leader.id)
  end

  #退会機能
  def unsubscribe
  end

  def withdraw
    #登録情報をfalseに変更
    @leader.update(is_deleted: true)
    #sessionIDのリセットを行う
    reset_session
    redirect_to root_path
  end
  
  private
  def if_not_current_leader
    @leader = Leader.find(params[:id])
    unless @leader == current_leader
      redirect_to leaders_leader_path(current_leader)
    end
  end
  def set_leader
    @leader = current_leader
  end
  def leader_params
    params.require(:leader).permit(:name, :leader_image, :circle_name, :prefecture_id, :introduction, :is_deleted)
  end
end
