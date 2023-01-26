class AddingImageToMenuItem < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_items, :image, :string
  end
end
