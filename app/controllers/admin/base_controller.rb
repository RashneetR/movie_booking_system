# frozen_string_literal: true

# module Admin
# class BaseController < ApplicationController
# before_filter :verify_admin

# def current_ability
# @current_ability ||= AdminAbility.new(current_user)
# end

# private

# def verify_admin
# redirect_to root_url unless current_user.role == "admin"
# end
# common behavior goes here ...
# end
# end
