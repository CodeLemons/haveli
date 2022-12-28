class Reservation < ApplicationRecord
  # belongs_to :customer
  belongs_to :restaurant
  validates :reservation_time, presence: true
  validates :party_size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :special_requests, presence: true
end
