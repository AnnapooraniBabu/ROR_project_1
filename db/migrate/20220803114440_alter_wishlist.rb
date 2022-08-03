class AlterWishlist < ActiveRecord::Migration[6.1]
  def change
    add_column :wishlists, :user_id, :bigint
  end
end
