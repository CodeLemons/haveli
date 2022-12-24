class ShoppingCartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :menu_item
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
