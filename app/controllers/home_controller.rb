class HomeController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def index
        
    end
    def main

    end
   
    def wishlist
        @items = Item.joins(:wishlist).all.map do|wishlist|
            wishlist
        end
     puts " @items is #{ @items}" 
 
    end

    def wishlist_items
        current_user = session[:current_user_id]
        puts " current_user is #{ current_user}"
         if current_user == nil
             flash[:alert] = "Please Login!"
             puts "cur_user_id is #{current_user}"
             redirect_to '/show/snacks'
        else 

             product_id = params[:product_id]
             flash[:alert] = "Added to Wishlist!"
             cur_user_id = session[:current_user_id]
             puts "cur_user_id is #{cur_user_id}"
             # puts "product_id is #{product_id}"
             # prod_id = {:item_id => product_id}
             # puts "Prod_id is #{prod_id}" 
             @wishlist_products = Wishlist.new item_id: product_id, user_id: cur_user_id['id']
             #puts "wishlist_products is #{@wishlist_products}"
             # locals: { wishlist_products:  @wishlist_products}
             # puts wishlist
             # p "================================================="
             # p "================================================="
             # p "================================================="
             wishlist_id = Wishlist
             if @wishlist_products.id == product_id
                render plain: 'Failed'
                # redirect_to wishlist
            else
              puts " @wishlist_products.id is #{wishlist_id}"
                @wishlist_products.save
                redirect_to "/show/snacks"
               
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
        redirect_to '/show/wish-list'
                  
    end
   def add_wl_item_to_cart

    current_user = session[:current_user_id]
        puts " current_user is #{ current_user}"
         if current_user == nil
             flash[:alert] = "Please Login!"
             puts "cur_user_id is #{current_user}"
             redirect_to '/show/wish-list'
        else 

    item_id = params[:item_id]
    
            remove_wl_item=Wishlist.find_by(item_id: item_id)
            remove_wl_item.destroy
        @wl_item_to_cart = Cart.create item_id: item_id , user_id: current_user['id']
        redirect_to '/show/wish-list'
        flash[:alert] = "Successfully added to cart!"
        end
       
   end
   
   
end
