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
        
        @wishlist_products = Wishlist.new(item_id: product_id)
        # puts "wishlist_products is #{@wishlist_products}"
        #  locals: { wishlist_products:  @wishlist_products}
        # puts wishlist
        p "================================================="
        p "================================================="
        p "================================================="

       
        if @wishlist_products.save
            redirect_to "/show/snacks"
            # redirect_to wishlist
        else
            render plain: 'Failed'
        end
    end
    
    end
   
   
end
