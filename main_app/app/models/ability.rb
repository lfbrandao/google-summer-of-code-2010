class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all
      can :manage, Repository
      
    end
    
    can :manage_users, User do
      user.role? :admin
    end
    
  end
  
end