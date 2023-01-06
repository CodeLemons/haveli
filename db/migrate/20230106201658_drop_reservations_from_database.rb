class DropReservationsFromDatabase < ActiveRecord::Migration[7.0]
  def change
    drop_table :reservations
  end
end
