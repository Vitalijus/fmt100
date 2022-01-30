Rails.application.routes.draw do


  resources :orders
  resources :vehicles
  get "my-vehicles", :to => 'vehicles#my_vehicles'

  devise_for :users
  resources :trackers

  # Sidekiq
  require "sidekiq/web"
  require "sidekiq-scheduler/web"
  require "sidekiq_unique_jobs/web"
  mount Sidekiq::Web, at: "/sidekiq"

  root to: "pages#home"
end
