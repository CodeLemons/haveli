class DropSomeTablesFromDatabase < ActiveRecord::Migration[7.0]
  def change
    drop_table :mobility_text_translations
    drop_table :mobility_string_translations
  end
end
