class UserMailer < ApplicationMailer
  default from: 'rashneetforsampleapp@gmail.com'

  def welcome_email(user)
    puts "\n\n\n\n\n hi hi #{user} hi hi \n\n\n\n"
    puts "\n\n\n\n\n hi hi #{user.id} hi hi \n\n\n\n"
    @user = User.find_by(id: user.id)
    #@user = User.find_by(id: params[:user][:id])
    #@user = params[:user]
    mail(to: @user.email, subject: 'Welcome to BookMyShow')
  end

  def movie_update
    # @subscriptions = params[:subscription]
    @users = params[:user]
    @movie_name = params[:movie_name]
    @users.each do |user_id|
      @user = User.find(user_id)
      mail(to: @user.email, subject: 'Movie release!')
    end
  end

  def ticket_booked
    @ticket = params[:ticket]
    mail(to: @ticket.user.email, subject: 'Tickets Confirmed')
  end

  #def sample_email
    #puts 'Hello1 '
    #@user = User.find(params[:user][:id])
    #puts "\n\n\n\n\n #{@user}\n\n\n"
    #mail(to: @user.email, subject: 'Sample Email')
    #puts 'Hello3 '
  #end
end