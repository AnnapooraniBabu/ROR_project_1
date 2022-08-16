class CreateCardDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :card_details do |t|
      t.string :card_holder_name
      t.bigint :card_no
      t.integer :card_year
      t.integer :card_cvv_no

      t.timestamps
    end
  end
end
