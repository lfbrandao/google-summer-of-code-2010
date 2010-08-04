class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :repositories
  
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :role_ids, :repository_ids
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
