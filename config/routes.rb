Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace :admin do
    root to: "home#index"
    resources :tours, except: %i(destroy)
    resources :users, only: %i(index show destroy)
    resources :bookings do
      member do
        post "update_status"
      end
    end
  end

  resources :notifications, only: :update
  resources :tours do
    resources :bookings
  end

  mount ActionCable.server => "/cable"
end
