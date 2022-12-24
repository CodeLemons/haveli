class CreateShoppingCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_cart_items do |t|
      t.integer :quantity
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
