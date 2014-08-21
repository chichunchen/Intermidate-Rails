Rails.application.routes.draw do
  devise_for :users
  resources :boards do
  	resources :comments
  end

  root to: 'boards#index'
end