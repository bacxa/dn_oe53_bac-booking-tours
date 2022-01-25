Rails.application.routes.draw do
  root to: "home#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users

  namespace :admin do
    root to: "home#index"
  end
end
