class Sound < ActiveRecord::Base
  mount_uploader :attachment, SoundUploader
  validates :name, presence: true
end
