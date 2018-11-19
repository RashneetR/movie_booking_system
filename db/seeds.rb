# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.new(name: 'Admin User', email: 'rashneetforsampleapp@gmail.com', password: 'admin@123', password_confirmation: 'admin@123', role: 'admin', confirmed_at: 'ISODate("2018-10-22T11:39:03.675Z")')

if admin.valid?
  admin.save

elsif admin.errors.any?
  admin.errors.full_messages.each do |msg|
    puts msg
  end
else
  puts '******NOT VALID*******'
end
