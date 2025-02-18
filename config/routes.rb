Rails.application.routes.draw do
  # Authentication routes (default Rails authentication)
  resource :session, only: [:new, :create, :destroy]
  resources :passwords, param: :token, only: [:new, :create, :edit, :update]

  # Application routes
  resources :books, only: [:index, :show]
  resources :borrowings, only: [:create, :destroy]
  resource :user, only: [:show]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root "books#index"
end