Rails.application.routes.draw do
  resources :changes, only: :create

  resources :orders, only: [:new, :create]

  get 'dashboard', to: 'dashboard#edit', as: 'dashboard'
  resources :categories
  resources :coaches
  resources :courts
  resources :events
  resources :stadiums do
    
  end
  resources :stadium_users
  resources :sales

  root to: 'visitors#index'
  devise_for :users
end
