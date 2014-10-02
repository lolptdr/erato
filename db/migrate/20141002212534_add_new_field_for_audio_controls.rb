class AddNewFieldForAudioControls < ActiveRecord::Migration
  def change
    add_column :uploads, :audio_attachment, :string
  end
end
