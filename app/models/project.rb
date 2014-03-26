class Project < ActiveRecord::Base
  attr_accessible :is_active, :name

  has_many :questions
  has_many :user_project_associations
  has_many :users, :through => :user_project_associations
  has_many :versions

end
