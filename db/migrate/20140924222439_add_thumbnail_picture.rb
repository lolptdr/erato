class AddThumbnailPicture < ActiveRecord::Migration
  def change
    change_table :carbons do |t|
      t.string :preview
    end
  end
end
