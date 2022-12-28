class AddFirstNameToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :first_name, :string
  end
end
