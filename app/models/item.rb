class Item < ApplicationRecord
    has_one :wishlist
    has_one :cart
end
