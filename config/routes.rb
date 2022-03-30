Rails.application.routes.draw do
  root 'home#home'
  get "/", to: "home#home"
  get 'user/createAccount'
  get 'user/login'
  get 'home/home'
  get 'transaction/index'
  
  resources :users
  resources :transactions
  resources :accounts
end
