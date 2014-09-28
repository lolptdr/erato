class Waveform < ActiveRecord::Base
  mount_uploader :attachment, WaveformUploader
  validates :name, presence: true
end
