# frozen_string_literal: true

class CartsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def cart
    #   @items = Item.joins(:wishlist).all.map do|wishlist|
    #     wishlist
    # end
    @cart_items = Item.joins(:cart).all.map do |cart|
      cart
      
    end
    @cart_quantity = Cart.all.map do |cart_item_quantity|
      cart_item_quantity
    end
    
  end

  def create
    current_user = session[:current_user_id]
    product_id = params[:product_id]
    default_quantity=1
    puts " current_user is #{current_user}"
    if current_user.nil?
      flash[:alert] = 'Please Login!'
      puts "cur_user_id is #{current_user}"
      redirect_back(fallback_location: root_path)
    else
      find_prod_id = Cart.find_by(item_id: product_id)
      if find_prod_id
         find_product =Item.joins(:cart).find_by(id: product_id)
         find_product_quantity = Cart.find_by(item_id: product_id)
         final_quantity= find_product_quantity.item_quantity+ default_quantity
         
        remove_old_items_quantity = find_product_quantity.destroy
        add_current_item = Cart.create item_id: product_id, user_id: current_user['id'], item_quantity: final_quantity
         p "find_product_quantity is #{find_product_quantity.item_quantity}"
         p "final_quantity is #{final_quantity}"
         # p "find_prod_id.quantity is #{ find_product.quantity }"  
         # find_prod_id.quantity
        
      
        flash[:alert]= 'Prouduct quantity added!'
        redirect_back(fallback_location: root_path)
      else
       
        cart_item_id = Cart.create item_id: product_id, user_id: current_user['id'], item_quantity: default_quantity
        flash[:alert] = 'Successfully added to cart!'
        # redirect_to '/show/snacks'
        redirect_back(fallback_location: root_path)

      end
    end
  end

  # def show_cart_items
  #   @cart_items = Cart.all.map do|items|
  #   puts  items
  #   end
  #   # puts "@cart_items is #{@cart_items}"

  # end
  def delete_item
    cart_product_id = params[:cart_item_id]
    puts "cart_product_id is #{cart_product_id}"
    cur_remove_cart_id = Cart.find_by(item_id: cart_product_id)
    puts "cur_remove_cart_id is #{cur_remove_cart_id}"
    if cur_remove_cart_id.destroy
      redirect_to '/cart'
    # render plain: true
    else
      render plain: false
    end
  end
end
