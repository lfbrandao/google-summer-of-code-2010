class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :repositories

  cattr_accessor :current_user
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :repository_ids, :password_confirmation, :password, :email
  
  # Authlogic
  acts_as_authentic do |c|
    c.login_field = :email
  end # block optional
  
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
