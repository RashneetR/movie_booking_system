require 'rake'

task delete_old_users: :environment do
  old_users = User.inactive.where(updated_at: 3.months.ago)

  old_users.each do |user|
    Ticket.where(user_id: user.id).destroy_all
    Review.where(user_id: user.id).destroy_all
    user.destroy
  end
end
