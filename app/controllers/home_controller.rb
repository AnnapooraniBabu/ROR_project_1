# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
 
  def index 
  end

  def main 
   end
 
   def user_profile
     
   end
def search
  @filtered_items = Item.where('category LIKE ? OR item_name LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
  p "==============================================="
  p "==============================================="
  p "==============================================="
  p @filtered_items
end

  def wishlist
    @items = Item.joins(:wishlist).all.map do |wishlist|
      wishlist
    end
    # puts " @items is #{@items}"
    # current_user = session[:current_user_id]
    # @item= Wishlist.where(user_id: current_user['id']).map do |saved|
    #   saved
    # end
    # "@item is #{@item}"
  end

  def wishlist_items
    current_user = session[:current_user_id]
    product_id = params[:wishlist_product_id]
    # puts " current_user is #{current_user}"
    if current_user.nil?
      flash[:alert] = 'Please Login!'
      puts "cur_user_id is #{current_user}"
      # redirect_to '/show/snacks'
      redirect_back(fallback_location: root_path)
    else
     
      cur_user_id = session[:current_user_id]
      find_prod_id = Wishlist.find_by(item_id: product_id)
      puts "Hhhhhhhhhhhhhhhhhhhhhhhhhhh"
      puts "product_id is #{product_id}"
      puts "find_prod_id is #{find_prod_id}"
      # puts find_prod_id.inspect
        if find_prod_id
          flash[:alert] = 'Already product exists!'
           redirect_back(fallback_location: root_path)
        else
          
          @wishlist_products = Wishlist.create item_id: product_id, user_id: cur_user_id['id'] 
          flash[:alert] = 'Added to Wishlist!'
          puts "+++++++++++++++"
          puts "+++++++++++++++"
          puts "+++++++++++++++"
          puts "product_id is #{product_id}"
          # puts "find_prod_id is #{find_prod_id['item_id']}"
          # puts product_id != find_prod_id['item_id']
          # flash[:alert] = 'Added to wishlist!'
         
          redirect_back(fallback_location: root_path) 
         
        end
        end
        end

  def delete_wishlist_item
    cur_user_id = session[:current_user_id]
    del_id = params[:wishlist_product_id]
    puts "wishlist_product_id is #{del_id}"
    del_wishlist = Wishlist.find_by(item_id: del_id)
    del_wishlist.destroy
    del_wishlist.save
    # redirect_to '/show/wish-list'
    redirect_back(fallback_location: root_path)
  end

  def add_wl_item_to_cart
    current_user = session[:current_user_id]
    puts " current_user is #{current_user}"
    if current_user.nil?
      flash[:alert] = 'Please Login!'
      puts "cur_user_id is #{current_user}"
      # redirect_to '/show/wish-list'
      redirect_back(fallback_location: root_path)
    else

      item_id = params[:item_id]

      remove_wl_item = Wishlist.find_by(item_id: item_id)
      remove_wl_item.destroy
      @wl_item_to_cart = Cart.create item_id: item_id, user_id: current_user['id']
      # redirect_to '/show/wish-list'
      flash[:alert] = 'Successfully added to cart!'
      redirect_back(fallback_location: root_path)
    end
  end
end
