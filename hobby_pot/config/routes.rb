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
    resources :circles, only:[:new, :create, :edit, :update, :destroy]
      post 'circles/confirm'
      post 'circles/back'
    #マイページ
    resources :leaders, only:[:show, :edit, :update] do
      member do
        #退会&ステータス変更
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :join_circles, only: [:index, :show, :update]
  end

  #ユーザー側ルート
  scope module: :users do
    #サークル
    resources :circles, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      # get 'bookmarks',on: :collection
      resource :join_circles, only: [:create,:destroy]
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
