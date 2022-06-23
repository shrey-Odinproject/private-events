Rails.application.routes.draw do
  # get 'users/show' 
  # get 'events/index'
  get "/users/:id", to: "users#show"
  get "/events", to: "events#index"

  devise_for :users
  
  root 'events#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
