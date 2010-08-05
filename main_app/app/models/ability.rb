class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
can :manage, :all

    if user.role? :admin
      can :manage, :all
      can :manage, Repository
      can :manage_users #users_controller
    end
    
    
  end
  
end