class Restaurant < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :orders
  has_many :reservations
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :website, presence: true, format: { with: URI.regexp(%w[http https]) }
  has_one_attached :video
  has_one_attached :logo
end
