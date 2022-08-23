# frozen_string_literal: true

class Item < ApplicationRecord
  has_one :wishlist
  has_one :cart  
# :dependent  :destroy
  # foreign_key: {on_update: :cascade, ondelete: :cascade }
  validates :item_name , presence: true, uniqueness: true
  validates :img_url , presence: true, uniqueness: true
  validates :category , presence: true
  validates :quantity , presence: true
  validates :price , presence: true
end