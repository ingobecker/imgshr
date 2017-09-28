class AddOcrToGallery < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :ocr, :boolean, default: false, null: false
  end
end
