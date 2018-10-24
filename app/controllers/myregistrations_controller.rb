class MyregistrationsController < Devise::RegistrationsController
  before_action :before_sign_up, :only => :create

  def before_sign_up
    @user = User.where(email: params[:user][:email]).first
    if @user.try(:active) == "inactive"
      redirect_to activate_account_users_path
    end
    @user
  end
end
