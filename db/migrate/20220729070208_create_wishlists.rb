# frozen_string_literal: true

class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists, &:timestamps
  end
end
