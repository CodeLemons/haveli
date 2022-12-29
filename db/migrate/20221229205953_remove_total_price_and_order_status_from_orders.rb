class RemoveTotalPriceAndOrderStatusFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :order_status
    remove_column :orders, :total_price
  end
end
