Rails.application.routes.draw do
  get 'users/register'
  #  'users/login'
  root 'moms_delishes#index'
  get 'register', to: 'moms_delishes#register'
  post '/moms_delishes',:to=>'moms_delishes#create'
  get 'login', to: 'users#login'
  resources :users, only: [:login, :create, :destroy] 
  # 'login', to: 'users#create'
  get 'main' , to: 'moms_delishes#main'
  # get 'user', to: 'moms_delishes#main'
  post '/user' , to: 'moms_delishes#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

