Rails.application.routes.draw do
  resources :trackers
  root to: "pages#home"
end
