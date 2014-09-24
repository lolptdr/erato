class ChangeNameOfUpload < ActiveRecord::Migration
  def change
    rename_column :carbons, :upload, :attachment
  end
end
