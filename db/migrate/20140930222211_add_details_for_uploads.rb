class AddDetailsForUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :name, :string
    add_column :uploads, :attachment, :string
  end
end
