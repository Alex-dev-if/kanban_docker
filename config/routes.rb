  Rails.application.routes.draw do
    resources :tasks do
      member do
        get 'update_status/:new_status', action: :update_status, as: :update_status
      end
    end 
    get 'dashboard', to: 'dashboard#index'
    root to: "tasks#index"
  end
