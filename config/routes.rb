Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/eligibility', to: 'pages#eligibility'
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :pro do
    resources :users, only: [:show]
    resources :bookings
    resources :reports, only: [:index, :show]
  end

  namespace :particulier do
    resources :users, only: [:show]
    resources :bookings
  end

  namespace :technician do
    resources :users, only: [:show, :index]
    resources :bookings, only: [:show, :index]
    resources :availabilities
    resources :reports
  end

  namespace :manager do
    resources :users
    resources :bookings
  end

  resources :users, only: [:show]
  resources :answers

end
