class Version < ActiveRecord::Base
  attr_accessible :name, :project_id, :version_status

  belongs_to :project
  has_many :manual_tests

  STATUSES = [New = 'new']
  validates_presence_of :name
  validates_presence_of :project_id
  validates_presence_of :version_status

  def new_tests_percent
    return 0 if manual_tests.empty?
    manual_tests.where(:test_status => [ManualTest::New, ManualTest::UnderVerification]).size.to_f / manual_tests.size.to_f * 100
  end

  def verified_tests_percent
    return 0 if manual_tests.empty?
    manual_tests.where(:test_status => ManualTest::Verified).size.to_f / manual_tests.size.to_f * 100
  end

  def passed_tests_percent
    return 0 if manual_tests.empty?
    manual_tests.where(:test_status => ManualTest::Passed).size.to_f / manual_tests.size.to_f * 100
  end

end
