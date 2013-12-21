class Question < ActiveRecord::Base
  attr_accessible :author_id, :description, :name, :status, :project_id
  validates_presence_of :project
  validates_presence_of :author
  validates_presence_of :name
  belongs_to :project
  belongs_to :author, :class_name => 'User'
  has_many :answers, :dependent => :destroy
end
