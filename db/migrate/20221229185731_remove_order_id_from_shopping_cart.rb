class RemoveOrderIdFromShoppingCart < ActiveRecord::Migration[7.0]
  def change
    remove_reference :shopping_carts, :order, index: true, foreign_key: true
  end
end
