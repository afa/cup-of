class Ability
 include CanCan::Ability

  def initialize(user)
   user ||= User.new #guest

   if user.username == 'afa' or user.username == 'kat'
    can :manage, :all
   else
    can :view, :all
   end
  end
end
