# frozen_string_literal: true

class Wishlist < ApplicationRecord
  belongs_to :item
  # belongs_to :cart
end
