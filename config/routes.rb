Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get 'profile', to: 'users#show'
  get 'search', to: 'pages#search'

  resources :posts, only: %i[show new create destroy]

  # Like button
  # Send a put request with the id of the post we want to like and call like method in the controller
  put '/post/:id/like', to: 'posts#like', as: 'like'
end
