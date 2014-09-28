class AddWaveformTable < ActiveRecord::Migration
  def change
    create_table :waveforms do |t|
      t.string :name
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
