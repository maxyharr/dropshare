class DropFile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :name, presence: true # Make sure the file's name is present.
    validate :user_id, presence: true # Make sure we can associate the file with a user
end
