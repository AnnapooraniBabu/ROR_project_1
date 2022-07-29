class AddItemToWishlist < ActiveRecord::Migration[6.1]
  def change
    add_reference :wishlists, :item, null: false, foreign_key: true
  end
end
