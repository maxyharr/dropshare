class Group < ActiveRecord::Base
  # To track activities for feed page
  include PublicActivity::Model
  # make sure controller is not nil  
  tracked owner: ->(controller, model) { controller && controller.current_user }
  
  belongs_to :user
  serialize :members,Array
end
