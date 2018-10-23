require 'rake'

task :delete_old_users => :environment do
  puts 'delete_old_users'
  old_users = User.where(active: "inactive")

  old_users.each do |user|
    if user.updated_at < 3.months.ago
      t = Ticket.where(user_id: user.id)
      r = Review.where(user_id: user.id)
      t.each do |t|
        t.destroy
      end
      r.each do |r|
        r.destroy
      end
      user.destroy
    end
  end
end

