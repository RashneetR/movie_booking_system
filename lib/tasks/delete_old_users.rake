require 'rake'

task delete_old_users: :environment do
  old_users = User.inactive.where(updated_at: 3.months.ago)
  Ticket.in(user_id: old_users.pluck(:id)).destroy_all
  Review.in(user_id: old_users.pluck(:id)).destroy_all
  olds_users.destroy_all
end
