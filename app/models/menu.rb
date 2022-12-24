class Menu < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true
  has_many :menu_items, dependent: :destroy
end
