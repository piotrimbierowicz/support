class Project < ActiveRecord::Base
  attr_accessible :is_active, :name

  has_many :questions

end
