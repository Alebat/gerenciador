class Action < ActiveRecord::Base
  belongs_to :project
  attr_accessible :activity
end
