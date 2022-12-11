class Restaurant < ApplicationRecord
  has_many :menus
  has_many :orders, through: :menus
  validates :name, presence: true
  validates :address, presence: true
end
