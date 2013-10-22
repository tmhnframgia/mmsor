Mmsor::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :teams, only: [:create, :destroy, :show]
  
  root "static_pages#home"

  match "/signup", to: 'users#new', via: 'get'

  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match '/buildteam', to: 'teams#new', via: 'get'
  match '/teams', to: 'teams#index', via: 'get'
  
end
