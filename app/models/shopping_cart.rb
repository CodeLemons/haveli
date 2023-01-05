class ShoppingCart < ApplicationRecord
  has_many :shopping_cart_items, dependent: :destroy
  def self.for_session(session_id)
    find_by(session_id: session_id)
  end
end
