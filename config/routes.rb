require 'sidekiq/web'
Rails.application.routes.draw do
  resources :tasks do
    member do
      get 'update_status/:new_status', action: :update_status, as: :update_status # rota para mudar o status
    end
  end 
  get 'dashboard', to: 'dashboard#index' # rota para dashboard
  root to: "tasks#index"
  get 'home', to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
