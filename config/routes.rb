Rails.application.routes.draw do
  # GQL playground http://localhost:3000/graphiql
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  # GQL endpoint
  post "/graphql", to: "graphql#execute"

  # Resources
  resources :trackers
  resources :orders, only: [:new, :create]
  resources :vehicles

  # Custom pages
  get "my-vehicles", to: "vehicles#my_vehicles"
  get "my-orders", to: "orders#my_orders"
  get "contacts", to: "pages#contacts"

  # Devise
  devise_for :users

  # Sidekiq
  require "sidekiq/web"
  require "sidekiq-scheduler/web"
  require "sidekiq_unique_jobs/web"
  mount Sidekiq::Web, at: "/sidekiq"

  # Home page
  root to: "vehicles#index"

  # Redirect all unknown routes to root_url / keep at the bottom of this file
  get '*path' => redirect('/')
end
