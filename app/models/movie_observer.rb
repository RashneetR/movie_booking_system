class MovieObserver < ActiveRecord::Observer
  def before_destroy(admin_movie)
    return true if admin_movie.shows.blank? && admin_movie.reviews.blank?

    #admin_theatre.errors.add(:base, "Cannot delete theatre due to existing shows for the theatre")
    throw(:abort)
  end

  def after_destroy(admin_movie)
    @subscriptions = MovieInterest.where(movie_id: admin_movie.id)
    @subscriptions.each(&:destroy)
  end
end
