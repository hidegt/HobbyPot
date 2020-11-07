Rails.application.routes.draw do
  devise_for :leaders, controllers: {
    sessions: 'leaders/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #リーダー側ルート
  namespace :leaders do
    resources :circles
  end
  
  #ユーザー側ルート
  scope module: :users do
    resources :circles, only: [:index, :show] 
  end
  root to: 'users/circles#top'
end
