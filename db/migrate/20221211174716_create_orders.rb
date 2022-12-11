class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.datetime :order_date
      t.float :total_price

      t.timestamps
    end
  end
end
