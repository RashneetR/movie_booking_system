class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def requires_admin
    valid = true
    unless current_user.try(:role) == 'admin'
      valid = false
      redirect_to root_path, notice: 'Access Denied'
    end
    valid
  end

  def requires_non_admin
    valid = true
    if current_user.try(:role) == 'admin'
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
    admin_movies_path if current_user.role == 'admin'  
    movies_path
  end

  def after_sign_in_path_for(_resource)
    admin_movies_path if current_user.role == 'admin'  
    movies_path
  end
end
