Rails.application.routes.draw do
  resources :coaches
  resources :stadiums
  resources :sales

  root to: 'visitors#index'
  devise_for :users
end
