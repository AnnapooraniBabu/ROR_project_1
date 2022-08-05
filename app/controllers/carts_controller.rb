class CartsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def cart
  #   @items = Item.joins(:wishlist).all.map do|wishlist|
  #     wishlist
  # end
   @cart_items =Item.joins(:cart).all.map do |cart|
    cart
  end
  end
  def create
    current_user = session[:current_user_id]
        puts " current_user is #{ current_user}"
             if current_user == nil
             flash[:alert] = "Please Login!"
             puts "cur_user_id is #{current_user}"
             redirect_to '/show/snacks'
             else
    product_id = params[:product_id]
    cart_item_id = Cart.new(item_id: product_id )
    if cart_item_id.save
      # render plain: true
      flash[:alert] = "Successfully added to cart!"
      redirect_to '/show/snacks'
      else
      render plain: false
      end
      end
end

# def show_cart_items
#   # @cart_items = Cart.all.map do|items| 
#   # puts  items
#   # end
#   # puts "@cart_items is #{@cart_items}"

# end
def delete_item
  cart_product_id = params[:cart_item_id]
  puts "cart_product_id is #{cart_product_id}"
  cur_remove_cart_id = Cart.find_by(item_id: cart_product_id )
  puts "cur_remove_cart_id is #{cur_remove_cart_id}"
  if cur_remove_cart_id.destroy
    redirect_to '/cart'
  # render plain: true
  else
    render plain: false
  end
  
end
end
