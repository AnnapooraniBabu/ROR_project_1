# frozen_string_literal: true

Rails.application.routes.draw do
  get '/payment', to: 'payments#payment'
  get 'carts/cart'
  root 'home#index'
  get 'main', to: 'home#main', as: :main
  resources :users
  # resources :home , only: [:index , :main]
  get '/login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'users/new', to: 'users#new'
  get 'about_us', to: 'home#about_us'
  get 'home', to: 'home#index'
  get 'users/home', to: 'home#index'
  get 'users/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  # match 'items/index',:to=>'items#index',:via=>:get
  get '/show/snacks', to: 'items#snacks'
  get '/show/papads&Fryums', to: 'items#papads_fryums'
  get '/show/healthmix', to: 'items#healthmix'
  get '/show/sweets', to: 'items#sweets'
  get '/show/jaggerysweets', to: 'items#jaggerysweets'
  get '/show/pickles', to: 'items#pickles'
  get '/item/:item_id', to: 'items#show_selected_item', as: :item_id

  get '/show/add', to: 'items#add'
  post 'items', to: 'items#create'
  get '/wishlist/:product_id', to: 'home#wishlist_items'
  get '/wish-list', to: 'home#wishlist'
  get '/show/wish-list', to: 'home#wishlist'
  get '/cart', to: 'carts#cart'
  get '/cart', to: 'carts#show_cart_items'
  get 'cart_page/:cart_item_id', to: 'carts#delete_item'
  delete '/show/wish-list/:wishlist_product_id', to: 'home#delete_wishlist_item'
  delete '/wish-list/:wishlist_product_id', to: 'home#delete_wishlist_item'
  get '/cart/:product_id', to: 'carts#create'

  get '/item/cart_page/:prod_id', to: 'items#add_to_cart'
  get '/wl/:item_id', to: 'home#add_wl_item_to_cart'

  get 'search',to: "home#search"
 
end
