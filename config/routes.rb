Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get 'profile', to: 'users#show'
  get 'search', to: 'pages#search'

  resources :posts, only: [:show, :new, :create, :destroy]
end
