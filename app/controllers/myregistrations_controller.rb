class MyregistrationsController < Devise::RegistrationsController
  before_action :before_sign_up, only: :create

  def before_sign_up
    @user = User.where(email: params[:user][:email]).first
    if @user && !@user.try(:active)
      redirect_to activate_account_user_url(@user)
    else
      return
    end
    @user
  end
end
