Rails.application.routes.draw do
  root "home#index" 
  get 'main', to: 'home#main', as: :main
  resources :users
  # resources :home , only: [:index , :main]
  get '/login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'users/new', to: 'users#new'
  get 'about_us', to: 'home#about_us'
  get 'home' , to: 'home#index'
  get 'users/home' , to: 'home#index'
  get 'users/login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
end

