class RemovePictureColumn < ActiveRecord::Migration
  def change
    remove_column :carbons, :picture
  end
end
