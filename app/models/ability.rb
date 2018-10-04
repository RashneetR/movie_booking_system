=beginclass Ability
  include CanCan::Ability

  def initialize(user)

    
       user ||= User.new # guest user (not logged in)
       if user.role == "admin"
        alias_action :edit, :to => :update
        alias_action :index, :show, :to => :read
        can :manage, Movie
        can :manage, Theatre
        can :manage, Show
        can :read, Ticket
        can :read, Review
        can [:update, :read] , User
   elsif user.role == "customer"



   elsif user.role == "critic"


    elsif user.role == "nil"
        can :read, Movie
    end  
  end
end
=end
#   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
