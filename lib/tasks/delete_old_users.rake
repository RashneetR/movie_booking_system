require 'rake'

task delete_old_users: :environment do
  old_users = User.where(active: 'inactive')

  old_users.each do |user|
    next unless user.updated_at < 3.months.ago

    t = Ticket.where(user_id: user.id)
    r = Review.where(user_id: user.id)
    t.each(&:destroy)
    r.each(&:destroy)
    user.destroy
  end
end
