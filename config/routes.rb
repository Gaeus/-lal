Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Dashboard Route
  get 'dashboard', to: 'dashboard#index'

  # Route pour Bookings Hideout
  resources :hideouts do
    resources :bookings do
      member do
        patch :accept
        patch :decline
      end
    end
  end
end
