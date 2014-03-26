class ManualTest < ActiveRecord::Base
  attr_accessible :content, :name, :project_id, :test_status, :user_id

  validates_presence_of :name
  validates_presence_of :content
  validates_presence_of :version
  validates_presence_of :test_status
  validates_presence_of :user

  belongs_to :user
  belongs_to :version

  STATUSES = [New = 'new', UnderVerification = 'under_verification', Verified = 'verified', Passed = 'passed']

end
