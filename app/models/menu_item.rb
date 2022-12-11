class MenuItem < ApplicationRecord
  belongs_to :menu
  validates :name, presence: true
  validates :price, presence: true
end
