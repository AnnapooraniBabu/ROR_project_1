Rails.application.routes.draw do
  root "home#index"
  get 'main', to: 'home#main', as: :main
  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  # get 'register', to: 'users#register'
end

