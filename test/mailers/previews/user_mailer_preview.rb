# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

 def sample_mail_preview
    UserMailer.sample_email(User.second)
  end

  def movie_mail_preview
    User.Mailer.movie_update(MovieInterest.last)
  end

  def welcome_mail_preview
    UserMailer.welcome_email(User.second)
  end

  def ticket_mail_preview
    UserMailer.ticket_booked(Ticket.last)
  end

end
