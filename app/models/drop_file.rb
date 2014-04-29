class DropFile < ActiveRecord::Base
  
  # To track activities for feed page
  include PublicActivity::Model
  # make sure controller is not nil
  tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }
   
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :name, presence: true, length: { maximum: 50 } # Make sure the file's name is present and not too long.
    validates :user_id, presence: true # Make sure we can associate the file with a user
    validates :attachment, presence: true
end
