class UserMailer < ApplicationMailer
  default from: 'rashneetforsampleapp@gmail.com'

  def welcome_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Welcome to BookMyShow')
  end

  def movie_update(user_id,movie)
    @movie_name = movie
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Movie release!')
  end

  def ticket_booked(ticket_id)
    @ticket = Ticket.find(ticket_id)
    mail(to: @ticket.user.email, subject: 'Tickets Confirmed')
  end

  def activate_user_account(email)
    @email = email
    mail(to: @email, subject: 'Activate Account')
  end

end