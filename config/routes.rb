Rails.application.routes.draw do
  root 'home#home'
  get "/", to: "home#home"
  get 'user/createUser'
  get 'home/home'
  get 'transaction/index'
  resources :users
end
