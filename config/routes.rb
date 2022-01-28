Rails.application.routes.draw do


  resources :vehicles
  get "my-vehicles", :to => 'vehicles#my_vehicles'

  devise_for :users
  resources :trackers
  root to: "pages#home"

  # Sidekiq
  require "sidekiq/web"
  require "sidekiq-scheduler/web"
  require "sidekiq_unique_jobs/web"
  mount Sidekiq::Web, at: "/sidekiq"
end
