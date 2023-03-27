Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root to: "toppages#index"
  resources :travels, only: %i[index new create edit update destroy]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: %i[new create]

  resources :travel_costs, only: %i[destroy update edit]
  get "travels/:id/travel_costs", to: "travel_costs#index", as: "travel_costs"
  get "travels/:id/travel_costs/new",
      to: "travel_costs#new",
      as: "new_travel_cost"
  post "travels/:id/travel_costs", to: "travel_costs#create"
end
