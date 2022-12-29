class ChangePhoneToStringInContacts < ActiveRecord::Migration[7.0]
  def change
    change_column :contacts, :phone, :string
  end
end
