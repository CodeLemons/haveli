class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.datetime :order_date
      t.time :order_time
      t.float :total_price
      t.string :order_status

      t.timestamps
    end
  end
end
