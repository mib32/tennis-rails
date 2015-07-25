Rails.application.routes.draw do
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
  end

  get 'dashboard/events', to: 'dashboard/events#index', as: 'dashboard'



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
        resources :courts do
          resources :events
          resources :special_prices
        end
        resources :orders
        resources :withdrawal_requests do
          member do
            get 'confirm'
          end
        end
        get 'orders', to: 'orders#index', as: 'wallet'
        get 'events/courts', to: 'events#courts', as: 'stadium_courts'
      end
    end
  end

  constraints RoleRouteConstraint.new('coach') do
    namespace :dashboard do
      scope module: :coach do
        resource :coach
        resources :customers
        resources :courts do
          resources :events
        end

        get 'orders', to: 'customers#index'
      end
    end
  end

  constraints RoleRouteConstraint.new('customer') do
    namespace :dashboard do
      scope module: :customer do
        resources :orders do
          member do
            patch 'pay'
          end
        end
        resources :deposit_requests
        resources :courts do
          resources :events, only: :index
        end
      end
    end
  end

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

  resources :coaches do
    resources :events, only: :index, controller: 'coach_events'
    resources :courts do
      resources :events, controller: 'coach_events'
    end
  end


  resources :stadiums, defaults: { model_name: 'Stadium' } do
    resources :events, only: :index
    resources :pictures, only: :index
    resources :reviews
    resources :courts do
      resources :events, controller: 'stadium_events'
    end
  end

  resources :stadium_users
  resources :sales

  get 'categories/:category_id', to: 'stadiums#index', as: 'category'

  root to: 'visitors#index'
  devise_for :users
end
