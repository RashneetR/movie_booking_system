class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_request
    valid = true
    unless current_user
      valid = false
      redirect_to root_path, notice: 'denied'
    end
    valid
  end

  def check_role
    valid = true
    unless current_user.try(:role) == 'admin'
      valid = false
      redirect_to root_path, notice: 'Access Denied'
    end
    valid
  end

  def check_user
    valid = true
    unless current_user.try(:role) != 'admin'
      valid = false
      redirect_to root_path, notice: 'Access Denied'
    end
    valid
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_confirmation_path_for(_resource)
    sign_in(resource) # In case you want to sign in the user
    after_sign_in_path_for(_resource)
  end

  def after_sign_up_path_for(_resource)
    if current_user.role != 'admin'
      movies_path
    else
      admin_movies_path
    end
  end

  def after_sign_in_path_for(_resource)
    if current_user.role != 'admin'
      movies_path
    else
      admin_movies_path
    end
   end
end