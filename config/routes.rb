Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#edit', as: 'dashboard'
  resources :categories
  resources :coaches
  resources :courts do
    resources :events
  end
  resources :stadiums do
    
  end
  resources :stadium_users
  resources :sales

  root to: 'visitors#index'
  devise_for :users
end
