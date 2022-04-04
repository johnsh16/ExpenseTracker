Rails.application.routes.draw do
  root 'home#home'
  get "/", to: "home#home"
  get 'user/signup'
  get 'user/login'
  get 'home/home'
  get 'transaction/index'

  post '/user/login', to: 'sessions#create'
  post '/user/signup', to: 'user#create'
  
  resources :user
  resources :transaction
  resources :account
end
