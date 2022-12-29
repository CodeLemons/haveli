class ShoppingCart < ApplicationRecord
  has_many :shopping_cart_items, dependent: :destroy
end
