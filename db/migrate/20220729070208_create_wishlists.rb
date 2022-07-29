class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|

      t.timestamps
    end
  end
end
