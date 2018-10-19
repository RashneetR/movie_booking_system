class TheatreObserver < Mongoid::Observer

  def before_destroy(admin_theatre)
    byebug
    return true if admin_theatre.shows.blank?

    admin_theatre.errors.add(:base, "Cannot delete theatre due to existing shows for the theatre")
    throw(:abort)
  end
end
