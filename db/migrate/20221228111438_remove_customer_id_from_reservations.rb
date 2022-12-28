class RemoveCustomerIdFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reservations, :customer, index: true, foreign_key: true
  end
end
