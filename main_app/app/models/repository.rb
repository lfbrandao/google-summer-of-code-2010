class Repository < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :roles
  
  def self.user_repositories
    current_user ||= User.new :role_ids => [3]
    
    # repositories associated with the user
    repositories_for_user = current_user.repositories
    
    # repositories associated with the user roles    
    user_roles = Role.find(current_user.role_ids, :include => :repositories)
    user_roles.each do |user_role|
      repositories_for_user << user_role.repositories
    end
    
    # remove duplicates and return repositories
    puts "Repository roles #{repositories_for_user.uniq}"
    repositories_for_user.uniq
  end
end
