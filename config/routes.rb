Rails.application.routes.draw do
  
  resources :posts do
  	resources :comments
  	resources :likes
  end
  get 'user/show'
  get 'user/index'
  devise_for :users
  root to: "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
