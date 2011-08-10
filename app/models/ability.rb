class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      cannot :manage, :all

      can [:create, :read], Cover
      can [:update, :destroy], Cover do |cover|
        cover.title.user == user && cover.illustration.user == user
      end
      
      can [:create, :read], [Title, Illustration]
      can [:update, :destroy], [Title, Illustration], :user_id => user.id
    end
  end
end
