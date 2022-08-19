class AlterAddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :item_quantity, :integer
    

  end
end
