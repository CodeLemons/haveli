class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
  validates :quantity, numericality: { only_integer: true }
end
