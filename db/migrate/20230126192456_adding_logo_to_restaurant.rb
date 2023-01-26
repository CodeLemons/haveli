class AddingLogoToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :logo, :string
  end
end
