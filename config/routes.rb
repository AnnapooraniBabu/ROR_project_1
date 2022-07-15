Rails.application.routes.draw do
  #  'users/login'
   root 'moms_delishes#index'
   get '/login', to: 'moms_delishes#login'
 
  get '/register', to: 'moms_delishes#register'
  post 'moms_delishes',:to=>'moms_delishes#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# rm /your_project_path/tmp/pids/server.pid

# /home/annapoorani/Ruby_project/ROR_project_1