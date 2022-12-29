class MakeMenuItemIdUniqueInShoppingCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_index :shopping_cart_items, :menu_item_id
    add_index :shopping_cart_items, :menu_item_id, unique: true
  end
end
