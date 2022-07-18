Rails.application.routes.draw do
  #  'users/login'
  root 'moms_delishes#index'
  get 'register', to: 'moms_delishes#register'
  post '/moms_delishes',:to=>'moms_delishes#create'
  get 'login', to: 'users#login'
  post 'login', to: 'users#create'
  get 'main' , to: 'moms_delishes#main'
  post '/user' , to: 'moms_delishes#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

