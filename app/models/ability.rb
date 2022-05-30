class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Recipe do |recipe|
      recipe.user_id == user.id
    end
  end
end
