class CreateCarbons < ActiveRecord::Migration
  def change
    create_table :carbons do |t|
      t.string :title
      t.text :description
      t.string :upload

      t.timestamps
    end
  end
end
