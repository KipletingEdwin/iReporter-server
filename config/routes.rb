Rails.application.routes.draw do


  # Authentication
  post 'register', to: 'auth#register'
  post 'login', to: 'auth#login'

  # Reports routes

  resources :reports, only: [:index, :show, :create, :update, :destroy]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Reports (records)
  namespace :api do
    namespace :v1 do
      resources :reports
    end
  end
end
