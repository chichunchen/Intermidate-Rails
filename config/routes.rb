Rails.application.routes.draw do
  devise_for :users
  resources :boards do
  	resources :comments
  end

  resources :users, only: [:show]

  root to: 'boards#index'
end