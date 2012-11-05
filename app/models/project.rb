class Project < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :collaborator_ids
 
  has_and_belongs_to_many :collaborators, class_name: User
  has_many :cards  
  has_many :actions
  belongs_to :user

  validates_presence_of :name, message: "Project must have a name."
  validates_uniqueness_of :name, scope: :user_id, message: "You alredy have a project with this name."
end
