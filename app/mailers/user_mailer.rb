class UserMailer < ApplicationMailer
  default from: 'rashneetforsampleapp@gmail.com'

  def welcome_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Welcome to BookMyShow')
  end

  def movie_update(movie_id)
    @subscriptions = MovieInterest.where(movie_id: movie_id)
    @movie_name = Movie.find(movie_id).name
    @users = @subscriptions.pluck(:user_id)
    @users.each do |user|
      @user = User.find(user)
      mail(to: @user.email, subject: 'Movie release!')  
    end
  end

  def ticket_booked(ticket_id)
    @ticket = Ticket.find(ticket_id)
    mail(to: @ticket.user.email, subject: 'Tickets Confirmed')
  end

  def activate_user_account(user,email)
    @user = user
    @email = email
    mail(to: @email, subject: 'Activate Account')
  end
end
