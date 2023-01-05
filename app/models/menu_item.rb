class MenuItem < ApplicationRecord
  extend Mobility
  include PgSearch::Model
  translates :description, type: :text
  belongs_to :menu
  has_many :shopping_cart_items
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :pieces, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_one_attached :photo
  pg_search_scope :search_by_id, against: [:menu_id]
end
