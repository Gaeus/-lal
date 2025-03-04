Rails.application.routes.draw do

  devise_for :users

  root to: "pages#home"

  # Route Adrien pour Accès Hideout Controller et Booking Controller
  resources :hideouts do
   resources :bookings
  end

end
