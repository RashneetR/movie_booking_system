class UserMailer < ApplicationMailer
  default from: "rashneet@amuratech.com"

  #def welcome_email
    #@user = params[:user]
    #email_with_name = %("#{@user.name}" <#{@user.email}>)
    #mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
  #end
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end