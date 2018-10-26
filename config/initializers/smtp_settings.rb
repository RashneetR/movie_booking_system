# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: '587',
  domain: 'gmail.net',
  user_name: 'rashneetforsampleapp@gmail.com',
  password: '@raashi6!',
  authentication: 'plain',
  enable_starttls_auto: true
}
