Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/eligibility', to: 'pages#eligibility'
  get '/detection', to: 'pages#detection'
  get '/diagnostic', to: 'pages#diagnostic'
  get '/societe', to: 'pages#societe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :pro do
    resources :users, only: [:show]
    resources :bookings
    resources :reports, only: [:index, :show]
  end

  namespace :particulier do
    resources :users
    resources :bookings
  end

  namespace :technician do
    resources :users
    resources :bookings
    resources :availabilities
    resources :reports, only: [ :index, :show, :new, :create, :edit]
  end

  namespace :manager do
    resources :users
    resources :bookings
  end

  resources :users, only: [:show]
  resources :answers

end
