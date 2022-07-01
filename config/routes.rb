Rails.application.routes.draw do
  # get 'users/show' 
  # get 'events/index'
  # get "/users/:id", to: "users#show"
  # get "/events", to: "events#index"

  devise_for :users
  # , :controllers => {registrations: 'registrations'}
  resources :users, only: [:show] # resources user should be below devise user to work
  resources :users do
    member do
      post 'invite'
    end
  end
  
  
  resources :invitations, only:[:new, :create, :destroy]
  
  resources :events
  root 'events#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
