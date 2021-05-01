Rails.application.routes.draw do
  root 'users#new'
  get "/signin", to: 'users#signin'
  post "/sign", to: 'users#sign'
  resources :rides
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
