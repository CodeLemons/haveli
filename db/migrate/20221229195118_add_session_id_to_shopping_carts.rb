class AddSessionIdToShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :shopping_carts, :session_id, :string
  end
end
