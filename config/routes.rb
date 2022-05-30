Rails.application.routes.draw do

  resources :trackers
  resources :orders, only: [:new, :create]
  resources :vehicles

  get "my-vehicles", to: "vehicles#my_vehicles"
  get "my-orders", to: "orders#my_orders"

  devise_for :users

  # Sidekiq
  require "sidekiq/web"
  require "sidekiq-scheduler/web"
  require "sidekiq_unique_jobs/web"
  mount Sidekiq::Web, at: "/sidekiq"

  # pages
  get "contacts", to: "pages#contacts"

  root to: "vehicles#index"

  # Redirect all unknown routes to root_url / keep at the bottom of this file
  get '*path' => redirect('/')
end
