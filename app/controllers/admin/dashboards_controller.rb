class Admin::DashboardsController < ApplicationController
  before_action :check_role
  before_action :set_admin_dashboard, only: %i[show edit update destroy]

  def index
    @admin_movies = Show.collection.aggregate([{ '$group' => { '_id' => '$movie_id', 'total_revenue' => { '$sum' => { '$multiply' => ['$cost_per_seat', '$num_seats_sold'] } } } }])
    @movies = Movie.in(:_id => @admin_movies.pluck(:_id)).pluck(:name)
    @admin_theatres = Show.collection.aggregate([{ '$group' => { '_id' => '$theatre_id', 'total_revenue' => { '$sum' => { '$multiply' => ['$cost_per_seat', '$num_seats_sold'] } } } 
      }])
    @theatres = Theatre.in(:_id => @admin_theatres.pluck(:_id)).pluck(:name)
  end
end