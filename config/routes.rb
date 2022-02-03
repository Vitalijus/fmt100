Rails.application.routes.draw do

  resources :trackers
  resources :orders, only: [:new, :create]
  resources :vehicles
  get "my-vehicles", to: "vehicles#my_vehicles"

  devise_for :users

  # Sidekiq
  require "sidekiq/web"
  require "sidekiq-scheduler/web"
  require "sidekiq_unique_jobs/web"
  mount Sidekiq::Web, at: "/sidekiq"

  # pages
  get "contacts", to: "pages#contacts"

  root to: "vehicles#index"
end
