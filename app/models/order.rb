class Order < ApplicationRecord
  belongs_to :restaurant
  has_one :shopping_cart, dependent: :destroy
end
