Rails.application.routes.draw do
  root to: 'toppages#index'
  resources :travels

  resources :users, only: [:new, :create]

end
