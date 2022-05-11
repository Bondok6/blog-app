class Ability
  include CanCan::Ability

  def initialize(user)
    # Users:
    return unless user.present?

    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id

    # Admins:
    return unless user.admin?

    can :manage, :all
  end
end
