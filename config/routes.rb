Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get 'profile', to: 'users#show'

  resources :posts, only: [:show, :new]
end
