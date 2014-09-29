class Waveshape < ActiveRecord::Base
  mount_uploader :attachment, WaveshapeUploader
  validates :name, presence: true
end
