class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :display_name, :role,
                  :project_ids

  ROLES = [Customer = 'customer', Administrator = 'administrator', Developer = 'developer']

  has_many :questions, :foreign_key => 'author_id'
  has_many :answers, :foreign_key => 'author_id'
  has_many :user_project_associations
  has_many :projects, :through => :user_project_associations

  def display_name
    if self[:display_name].nil?
      return email
    end
    return self[:display_name]
  end

end
