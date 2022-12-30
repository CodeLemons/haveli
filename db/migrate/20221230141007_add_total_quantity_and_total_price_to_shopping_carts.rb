class AddTotalQuantityAndTotalPriceToShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :shopping_carts, :total_quantity, :integer
    add_column :shopping_carts, :total_price, :decimal
  end
end
