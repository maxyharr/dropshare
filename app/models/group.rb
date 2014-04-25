class Group < ActiveRecord::Base
  belongs_to :user
  serialize :members,Array
end
