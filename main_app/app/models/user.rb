class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :repositories
  
  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :role_ids, :repository_ids
  
  # Authlogic
  acts_as_authentic do |c|
    c.login_field = :email
  end # block optional
  
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
