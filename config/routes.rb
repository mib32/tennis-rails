Rails.application.routes.draw do
  resources :changes, only: :create

  resources :orders do
    member do
      patch 'pay'
    end
    collection do
      get 'total'
    end
  end

  get 'dashboard', to: 'dashboard#edit', as: 'dashboard'
  # resources :categories
  resources :coaches
  resources :courts
  resources :events
  resources :stadiums do
    
  end
  resources :stadium_users
  resources :sales

  get 'categories/:category_id', to: 'stadiums#index', as: 'category'

  root to: 'visitors#index'
  devise_for :users
end
