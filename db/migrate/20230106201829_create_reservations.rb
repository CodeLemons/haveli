class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :party_size
      t.datetime :date_time
      t.text :remarks

      t.timestamps
    end
  end
end
