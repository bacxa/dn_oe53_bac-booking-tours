Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace :admin do
    root to: "home#index"
    resources :tours
  end

  resources :tours do
    member do
      get :new_booking
      post :booking
    end
  end
end
