class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.role? :admin
      puts "ROLE ADMIN"
      can :manage, :all
      can :manage, Repository
    end
    puts "NO ROLE"
  end
  
end