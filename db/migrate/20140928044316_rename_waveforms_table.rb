class RenameWaveformsTable < ActiveRecord::Migration
  def change
    rename_table :waveshapes, :waveshapes
  end
end
