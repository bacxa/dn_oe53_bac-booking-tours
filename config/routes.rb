Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace :admin do
    root to: "home#index"
    resources :tours, except: %i(destroy)
  end

  resources :tours do
    resources :bookings
  end
end
