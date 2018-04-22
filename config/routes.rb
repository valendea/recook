Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'sessions#new'
  
  # Define the route to make it more friendly
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/vote', to: 'votes#create', as: 'vote'


	get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :users
  resources :sessions, only: [:create]
  resources :recipes
  resources :vote, only: [:create]
  root 'welcome#index'
end
