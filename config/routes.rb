Rails.application.routes.draw do
  # get 'users/show' 
  # get 'events/index'
  # get "/users/:id", to: "users#show"
  # get "/events", to: "events#index"

  devise_for :users
  # , :controllers => {registrations: 'registrations'}
  resources :users, only: [:show] # resources user should be below devise user to work
  
  resources :invitations, only:[:new, :create]
  
  resources :events, only: [:index, :new, :create, :show]
  root 'events#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
