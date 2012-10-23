class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :user_id
 
  has_and_belongs_to_many :collaborators, class_name: User
  #has_many :cards  

  validates_presence_of :name, message: "Project must have a name."
end
