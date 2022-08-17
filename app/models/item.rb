# frozen_string_literal: true

class Item < ApplicationRecord
  has_one :wishlist
  has_one :cart  
# :dependent  :destroy
  # foreign_key: {on_update: :cascade, ondelete: :cascade }
end