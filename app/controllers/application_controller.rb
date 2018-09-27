# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(_resource)
    if current_user.role != 'admin'
      movies_index_url
    else
      admin_movies_path
    end
  end

  def after_sign_up_path_for(_resource)
    if current_user.role != 'admin'
      movies_index_url
    else
      admin_movies_path

    end
  end
end
