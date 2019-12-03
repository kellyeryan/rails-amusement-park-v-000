Rails.application.routes.draw do
  resources :sessions
  resources :rides
  resources :users
  resources :attractions

  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/session", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
