class HomeController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def index
        
    end
    def main

    end
   
    def wishlist
        @items = Item.joins(:wishlist).all.map do|wishlist|
        #  locals: { items:  @items}
        # @items = Wishlist.all.map do|wishlist|
            wishlist
        end
     puts " @items is #{ @items}" 
 
    end

    def wishlist_items
        # @wl_items = Wishlist.all, 
        product_id = params[:product_id]
        # puts "product_id is #{product_id}"
        # prod_id = {:item_id => product_id}
        # puts "Prod_id is #{prod_id}"
        @wishlist_products = Wishlist.new(item_id: product_id)
        puts "wishlist_products is #{$wishlist_products}"
        #  locals: { wishlist_products:  @wishlist_products}
        # puts wishlist
        p "================================================="
        p "================================================="
        p "================================================="

        if @wishlist_products.save
            render plain: 'Success'
            # redirect_to wishlist
        else
            render plain: 'Failed'
        end
    end
   
    # def get_wishlist_data
    #     # wish_list = Item.select('id') 
    #     items = Item.joins(:wishlist)
    # end
    # private
    # def wishlist_params

    #   params.require(:wishlist).permit(:item_id)
      # params.require(:todo).permit(:task,:date_task)
    # end
end
