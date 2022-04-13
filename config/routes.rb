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
  get '/accounts/update/:id', to: 'accounts#update'
  post '/accounts/edit/:id', to: 'accounts#update'
  get '/accounts/hidden', to: 'accounts#hidden'
  get '/accounts/remove/:id', to: 'accounts#remove'
  get '/accounts/activate/:id', to: 'accounts#activate'
  get '/accounts/:id/:func', to: 'accounts#filter'

  post '/user/login', to: 'sessions#create'
  post '/user/signup', to: 'user#create'
  get '/user/logout', to: 'sessions#destroy'

  get '/transactions/index'
  get '/transactions/show/date::date/', to: 'transactions#show_by_date'
  get '/transactions/new'
  get '/transactions/create'
  post '/transactions/new', to: 'transactions#create'
  post '/transactions/create', to: 'transactions#create'
  get '/transactions/edit'
  get '/transactions/edit/:id', to: 'transactions#edit'
  post '/transactions/edit/:id', to: 'transactions#update'
  get '/transactions/remove/:id', to: 'transactions#remove'
  get '/transactions/all', to: 'transactions#all'
  post '/transactions/all', to: 'transactions#activate'
  get '/transactions/activate/:id', to: 'transactions#activate'

  get '/home/data/:id', to: 'home#data'
  
  resources :users
  resources :transactions
  resources :accounts
end
