class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :guest, user.organisation
      guest(user)
    elsif user.has_role? :team_member, user.organisation
      team_member(user)
    elsif user.has_role? :admin, user.organisation
      admin(user)
    end

  end


  private

  def guest(user)
    can :create, User
    can :update, User
    can :manage, User, :id => user.id
    can :read, Organisation, id=> user.organisation_id
  end

  def team_member(user)
    user(user)
    can [:read,:edit,:update], Organisation, id=> user.organisation_id
  end

  def admin(user)
    can :manage, :all
  end


end