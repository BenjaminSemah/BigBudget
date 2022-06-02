class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Group do |group|
      group.user_id == user.id
    end

    can :manage, Entity do |entity|
      entity.user_id == user.id
    end
  end
end
