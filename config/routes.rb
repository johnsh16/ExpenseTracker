Rails.application.routes.draw do
  root 'home#home'
  get "/", to: "home#home"
  get 'user/signup'
  get 'user/login'
  get 'home/home'
  get 'transaction/index'
  get 'account/index'
  get 'account/new'

  post '/user/login', to: 'sessions#create'
  post '/user/signup', to: 'user#create'
  get '/user/logout', to: 'sessions#destroy'

  get '/transaction/new', to: 'transactions#create'
  get 'transaction/create'
  post 'transaction/new', to: 'transactions#create'
  
  resources :user
  resources :transactions
  resources :account
end
