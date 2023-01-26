class AddingPathToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :video, :string
  end
end
