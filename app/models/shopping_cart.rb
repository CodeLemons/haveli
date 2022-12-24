class ShoppingCart < ApplicationRecord
  belongs_to :order
  has_many :shopping_cart_items
end
