class AddOcrTextToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :ocr_text, :text
  end
end
