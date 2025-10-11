Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication
  post 'register', to: 'auth#register'
  post 'login', to: 'auth#login'

  # Reports (records)
  namespace :api do
    namespace :v1 do
      resources :reports
    end
  end
end
