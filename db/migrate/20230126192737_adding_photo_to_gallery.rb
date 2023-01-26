class AddingPhotoToGallery < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :photo, :string
  end
end