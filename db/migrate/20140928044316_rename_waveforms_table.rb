class RenameWaveformsTable < ActiveRecord::Migration
  def change
    rename_table :waveforms, :waveshapes
  end
end
