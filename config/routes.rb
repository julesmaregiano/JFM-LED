Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :pro do
    resources :users
    # resources :bookings
    # resources :availabilities
  end

  namespace :particulier do
    resources :users
  end

  namespace :tech do
  end

  namespace :manager do
    resources :users, :bookings, :availabilities
  end

  resources :users, only: [:show]

end
