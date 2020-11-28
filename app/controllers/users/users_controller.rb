class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_current_user, only: [:edit, :update, :unsubscribe, :withdraw]
  before_action :set_user, only: [:edit, :update, :unsubscribe, :withdraw]
  def show
    @user = User.find(params[:id])
    @join_circles = @user.j_circles.page(params[:page]).per(4)
    @bookmarks = @user.fav_circles.page(params[:page]).per(4)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  #退会機能
  def unsubscribe
  end

  def withdraw
    #登録情報をfalseに変更
    @user.update(is_deleted: true)
    #sessionIDのリセットを行う
    reset_session
    redirect_to root_path
  end

  private
  def if_not_current_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:name, :user_image, :prefecture_id, :introduction, :is_deleted)
  end
end
