class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    alias_action :index, :destroy, to: :see
    alias_action :new, to: :create1
    alias_action :show, :create, :index, :update_count, to: :access
    alias_action :activate_account, :activate_account_mail, :activate_user_account, to: :activate
    if user.role == 'admin'
      can :manage, [Movie, Theatre, Show]
      can %i[see], Review
      can %i[update read destroy], User
      can %i[index], MovieInterest
      can %i[read], Ticket
    else
      can :read, Movie
      can %i[activate], User
      unless user.role.nil?
        can :access, Ticket
        can %i[update show destroy], User
        can %i[see read create], MovieInterest
        if user.role == 'customer'
          can :read, Review
        elsif user.role == 'critic'
          can %i[read update create new destroy], Review
        end
      end
    end
  end
end
