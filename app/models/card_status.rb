class CardStatus < ActiveRecord::Base
  attr_accessible :status
  has_many :cards
end
