Rails.application.routes.draw do
  devise_for :users
  resources :boards

  root to: 'home#index'
end