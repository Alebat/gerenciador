class Card < ActiveRecord::Base
  belongs_to :project
  belongs_to :card_status
  attr_accessible :code, :points, :story, :project_id, :card_status_id
end
