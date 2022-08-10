# frozen_string_literal: true

class AddItemToCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :item, null: false, foreign_key: true
  end
end
