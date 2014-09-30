class CreateVibrations < ActiveRecord::Migration
  def change
    create_table :vibrations do |t|
      t.string :title
      t.string :attachment
      
      t.timestamps
    end
  end
end
