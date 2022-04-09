Rails.application.routes.draw do
  root 'home#home'
  get "/", to: "home#home"
  get 'user/signup'
  get 'user/login'
  get 'home/home'

  post '/accounts/new', to: 'accounts#create'
  get '/accounts/index'
  get '/accounts/new', to: 'accounts#new'
  get '/accounts/create'
  get '/accounts/edit'
  get '/accounts/edit/:id', to: 'accounts#edit'
  post '/accounts/edit/:id', to: 'accounts#update'

  post '/user/login', to: 'sessions#create'
  post '/user/signup', to: 'user#create'
  get '/user/logout', to: 'sessions#destroy'

  get 'transactions/index'
  get '/transactions/new'
  get '/transactions/create'
  post '/transactions/new', to: 'transactions#create'
  get '/transactions/edit'
  get '/transactions/edit/:id', to: 'transactions#edit'
  post '/transactions/edit/:id', to: 'transactions#update'
  
  resources :users
  resources :transactions
  resources :accounts
end
