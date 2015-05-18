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

  get 'dashboard', to: 'dashboard/events#index', as: 'dashboard'
  get 'dashboard/payment_settings', to: 'dashboard#payment_settings', as: 'dashboard_payment_settings'
  namespace :dashboard do
    resources :events
    resource :stadium do
      resources :pictures, defaults: { imageable_type: 'Stadium'}
    end
    resources :deposit_requests
    resources :courts do
      resources :special_prices
    end
    resources :orders, only: :index

    post 'payments/success'
  end
  # resources :categories
  resources :coaches
  resources :courts
  resources :events
  resources :stadiums, defaults: { model_name: 'Stadium' } do
    resources :events, only: :index
    resources :pictures, only: :index
    resources :reviews
  end
  resources :stadium_users
  resources :sales

  get 'categories/:category_id', to: 'stadiums#index', as: 'category'

  root to: 'visitors#index'
  devise_for :users
end
