# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :edit, to: :update
    alias_action :index, :show, to: :read
    alias_action :show, :new, :create, to: :access
    if user.role == 'admin'
      can :manage, [Movie, Theatre, Show]
      can :read, Review
      can %i[update read], User
      can :read, MovieInterest
    elsif user.role == 'customer'
      can :read, Movie
      can :read, Review
      can :access, Ticket
      can :manage, User
      can :manage, MovieInterest
    elsif user.role == 'critic'
      can :manage, Review
      can :read, Movie
      can :access, Ticket
      can :manage, User
      can :manage, MovieInterest
    elsif user.role.nil?
      can :read, Movie
 end
  end
end

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
