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
    get '/dashboard', to: "dashboards#show"
    resources :users, only: [:show]
    resources :bookings, only: [:new, :create, :show, :index, :edit, :update]
    resources :reports, only: [:index, :show]
    resources :availabilities, only: [:show]
    resources :foremen, only: [:create]
    resources :report, only: [:show]
  end

  namespace :particulier do
    get '/dashboard', to: "dashboards#show"
    resources :users, only: [:show]
    resources :bookings
    get '/infos', to: "pages#informations"
  end

  namespace :technician do
    get '/dashboard', to: "dashboards#show"
    resources :users, only: [:show, :index]
    resources :bookings, only: [:show, :index]
    resources :availabilities, only: [:index]
    resources :reports
  end

  namespace :manager do
    get '/dashboard', to: "dashboards#show"
    get '/planning', to: "bookings#edit"
    resources :users, only: [:show, :index]
    resources :bookings, only: [:show, :index, :update]
    resources :availabilities, only: [:index, :show, :update, :create]
    resources :reports, only: [:show, :edit, :index]
    resources :companies, only: [:create, :update]
    resources :branches, only: [:create, :update]
  end

  resources :answers, only: [:show]

end
