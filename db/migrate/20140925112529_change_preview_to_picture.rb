class ChangePreviewToPicture < ActiveRecord::Migration
  def change
    rename_column :carbons, :preview, :picture
  end
end
