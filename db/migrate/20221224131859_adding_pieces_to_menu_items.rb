class AddingPiecesToMenuItems < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_items, :pieces, :integer
  end
end
