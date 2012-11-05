class Card < ActiveRecord::Base
  belongs_to :project
  belongs_to :card_status
  attr_accessible :code, :points, :story, :project_id, :card_status_id

  validates_uniqueness_of :code, scope: :project_id, allow_blank: true, message: "You alredy have a card with this code in this project."
  validates_presence_of :story, message: "Card must have a story."
  # validates_numericality_of :code
  # validates_numericality_of :points
end
