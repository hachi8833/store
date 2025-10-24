class WishlistProduct < ApplicationRecord
  belongs_to :product
  belongs_to :wishlist
end
