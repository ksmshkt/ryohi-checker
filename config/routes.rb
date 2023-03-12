Rails.application.routes.draw do
  root to: 'toppages#index'
  resources :travels
end
