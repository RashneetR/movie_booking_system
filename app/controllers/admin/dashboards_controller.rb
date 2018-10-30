class Admin::DashboardsController < ApplicationController
  before_action :check_role

  def index
    @admin_movies = Show.collection.aggregate([{ '$group' => { '_id' => '$movie_id', 'total_revenue' => { '$sum' => { '$multiply' => ['$cost_per_seat', '$num_seats_sold'] } } } }])
    @movies = Movie.in(:_id => @admin_movies.pluck(:_id)).pluck(:name)
    @admin_theatres = Show.collection.aggregate([{ '$group' => { '_id' => '$theatre_id', 'total_revenue' => { '$sum' => { '$multiply' => ['$cost_per_seat', '$num_seats_sold'] } } } 
      }])
    @theatres = Theatre.in(:_id => @admin_theatres.pluck(:_id)).pluck(:name)
  end
end