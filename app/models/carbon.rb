class Carbon < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  validates :title, presence: true
end
