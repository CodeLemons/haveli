class AddShoppingCartItemsForeignKeyToShoppingCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :shopping_carts, :shopping_cart_items, index: true, foreign_key: true
  end
end
