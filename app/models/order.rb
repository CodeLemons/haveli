class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant
  has_one :shopping_cart
  validates :order_date, presence: true
  validates :order_time, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :order_status, presence: true, inclusion: { in: %w(pending paid cancelled) }
end
