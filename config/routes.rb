Rails.application.routes.draw do
  root to: 'travels#index'
  resources :travels
end
