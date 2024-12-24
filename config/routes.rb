Rails.application.routes.draw do
  root 'dashboard#index'  # or whatever controller/action is appropriate

  get "up" => "rails/health#show", as: :rails_health_check
  post 'registrations', to: 'registrations#create'
  post 'contact', to: 'contacts#create'
  post 'registrationsmail', to: 'registrationsmail#create'
 # get 'login', to: 'sessions#new', as: 'login'
 # post 'login', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy', as: :logout
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  namespace :admin do
    resources :teams
    resources :individuals, only: [:index, :show, :destroy]
  end
end
