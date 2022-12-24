class AddWeightToMenuItems < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_items, :weight, :integer
  end
end
