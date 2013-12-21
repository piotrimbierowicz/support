class Answer < ActiveRecord::Base
  attr_accessible :author_id, :content, :question_id
  belongs_to :author, :class_name => 'User'
  belongs_to :question
  validates_presence_of :author
  validates_presence_of :question
end
