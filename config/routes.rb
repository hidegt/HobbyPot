Rails.application.routes.draw do
  devise_for :leaders, controllers: {
    registrations: 'leaders/registrations',
    sessions: 'leaders/sessions'
  }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #リーダー側ルート
  namespace :leaders do
    #サークル
    resources :circles, only:[:new, :create, :show, :edit, :update] do
    end
    #マイページ
    resources :leaders, only:[:show, :edit, :update] do
      member do
        #退会&ステータス変更
        get 'unsubscribe'
        patch 'withdraw'
        resources :notifications, only: :index
      end
    end
  end

  #ユーザー側ルート
  scope module: :users do
    #サークル
    resources :circles, only: [:index, :show] do
      member do
        get 'join_circles'
      end
      resource :favorites, only: [:create, :destroy]
      resource :join_circles, only: [:index, :create, :destroy]
      resources :circle_comments, only:[:create, :destroy]
    end

    #マイページ
    resources :users, only:[:show, :edit, :update] do
      member do
        #退会&ステータス変更
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
  end

  root to: 'users/circles#top'
end
