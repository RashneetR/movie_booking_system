class ShowObserver < ActiveRecord::Observer
  def before_destroy(admin_show)
    return true if admin_show.tickets.blank?

    #admin_theatre.errors.add(:base, "Cannot delete theatre due to existing shows for the theatre")
    throw(:abort)
  end
  


end
