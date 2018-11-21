# This file should contain all the record creation needed to seed the database with its default values.
time = Time.now
admin = User.create(name: 'Admin User', email: 'rashneetforsampleapp@gmail.com', password: 'admin@123', password_confirmation: 'admin@123', role: 'admin', confirmed_at: time)
