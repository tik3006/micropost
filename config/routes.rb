Rails.application.routes.draw do
  root to: 'toppages#index'
  
  #ルーティングの個別設定
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
