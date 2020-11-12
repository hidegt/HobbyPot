Rails.application.routes.draw do
  namespace :leaders do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  get 'favorites/create'
  get 'favorites/destroy'
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
    resources :circles do
      resource :favorites, only: [:create, :destroy]
      get 'bookmarks', on: :collection
    end
    # 退会機能をつける
    resources :leaders, only:[:show, :edit, :update] do
      member do
        #退会&ステータス変更
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
  end

  #ユーザー側ルート
  scope module: :users do
    resources :circles, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      get 'bookmarks', on: :collection
    end
    # 退会機能をつける
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
