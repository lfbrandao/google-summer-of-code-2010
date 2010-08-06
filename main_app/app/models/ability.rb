class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(:role_ids => Array.[](Role.find_by_name("Guest").id))
    
    if user.role? :admin
      can :manage, :all
    end
    
    can :manage_users, User do
      user.role? :admin
    end
  end
end