Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :hideouts # debug

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
  # Route pour searchbar
  get 'search', to: 'pages#search'
  resources :hideouts # debug
end
