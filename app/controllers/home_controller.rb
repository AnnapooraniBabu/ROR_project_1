class HomeController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def index
        
    end
    def main
    end
    def wishlist
        
    end
    def wishlist
        # user = User.new(register_params)
      
        
        
        # @current_item_id = Item.find(product_id)
        # puts @current_item_id
    end

    def wishlist_item
        product_id = params[:product_id]
        puts "product_id is #{product_id}"
        prod_id = {:item_id => product_id}
        # prod_id = Hash.new(product_id)
        puts "Prod_id is #{prod_id}"
        wishlist = Wishlist.new(prod_id)
        if wishlist.save
            render plain: 'Success'
        else
            render plain: 'Failed'
        end

    end
    # private
    # def wishlist_params

    #   params.require(:wishlist).permit(:item_id)
      # params.require(:todo).permit(:task,:date_task)
    # end
end
