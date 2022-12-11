class Order < ApplicationRecord
  validate :order_date_is_valid_datetime
  belongs_to :customer
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy

  def order_date_is_valid_datetime
    errors.add(:order_date, 'must be a valid datetime') if ((DateTime.parse(happened_at) rescue ArgumentError) == ArgumentError)
  end
end
