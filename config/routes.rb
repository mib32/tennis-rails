Rails.application.routes.draw do
  concern :bookable do 
    resources :events
  end
  scope :dashboard do 
    resources :products
  end
  resources :events do 
    collection do 
      get 'private'
      get 'grid', as: 'dashboard'
    end
  end

  post 'feedback/create', as: 'feedback'

  resources :static_pages, only: :show

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  namespace :admin do
    resources :users
  end
  # resources :changes, only: :create

  post 'payments/success'

  resources :orders do
    collection do
      get 'total'
    end
    member do
      patch 'pay'
    end
  end



  namespace :admin do
    resources :stadiums
    resources :users
    resource :options,  only: [:edit, :update]
    resources :static_pages
    resources :categories
    root to: 'stadiums#index'
  end

  constraints RoleRouteConstraint.new('stadium_user') do
    namespace :dashboard do
      scope module: :stadium do
        resource :stadium do
          resources :pictures, defaults: { imageable_type: 'Stadium'}
          resources :coaches
        end
        resources :courts, concerns: :bookable do
          resources :special_prices
        end
        resources :orders
        resources :withdrawal_requests do
          member do
            get 'confirm'
          end
        end
        get 'orders', to: 'orders#index', as: 'wallet'
      end
    end
  end

  constraints RoleRouteConstraint.new('coach_user') do

    namespace :dashboard do
      scope module: :coach do
        resource :coach
        resources :events
        resources :customers
        resources :courts do
          resources :events
        end

        get 'orders', to: 'customers#index'
      end
    end
  end

  resources :deposit_requests

  constraints RoleRouteConstraint.new('admin') do
    namespace :dashboard do
      scope module: :customer do
        resources :orders do
          member do
            patch 'pay'
          end
        end
      end
    end
  end
  resources :courts

  resources :coaches, defaults: { layout: 'coach', scope: 'coach' } do 
    resources :courts, concerns: :bookable
  end

  resources :stadiums, defaults: { layout: 'stadium', scope: 'stadium' } do
    resources :pictures, only: :index
    resources :reviews
    resources :courts, concerns: :bookable
  end

  # get 'events/grid', to: 'events#grid', as: 'dashboard'

  resources :stadium_users
  resources :sales

  get 'categories/:category_id', to: 'stadiums#index', as: 'category'

  root to: 'visitors#index'
  devise_for :users
end
