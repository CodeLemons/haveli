class AddLastNameToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :last_name, :string
  end
end
