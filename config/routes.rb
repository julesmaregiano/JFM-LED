Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/eligibility', to: 'pages#eligibility'
  get '/detection', to: 'pages#detection'
  get '/diagnostic', to: 'pages#diagnostic'
  get '/societe', to: 'pages#societe'

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
    get '/infos', to: "pages#informations"
  end

  namespace :technician do
    resources :users, only: [:show, :index]
    resources :bookings, only: [:show, :index]
    resources :availabilities
    resources :reports
  end

  namespace :manager do
    get '/planning', to: "bookings#edit"
    resources :users
    resources :bookings
    resources :availabilities
    resources :reports
  end

  resources :users, only: [:show]
  resources :answers

end
