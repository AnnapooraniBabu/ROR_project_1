class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :img_url
      t.string :item_name
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
