# frozen_string_literal: true

class Item < ApplicationRecord
  has_one :wishlist
  has_one :cart
end
