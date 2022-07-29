class HomeController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def index
        
    end
    def main
    end
    def wishlist
        
    end
    def wishlist
        product_id = params[:product_id]
        # puts "product_id#{product_id}"
        # @current_item_id = Item.find(product_id)
        # puts @current_item_id
    end
end
