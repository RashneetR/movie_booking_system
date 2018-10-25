class Admin::DashboardsController < ApplicationController
  before_action :check_role
  before_action :set_admin_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /admin/dashboards
  # GET /admin/dashboards.json
  def index
    @theatres = []
    @movies = []
    @admin_movies = Show.collection.aggregate( [ { "$group" => { "_id" => "$movie_id","total_revenue" => { "$sum" => { "$multiply" => ["$cost_per_seat","$num_seats_sold"] } } } } ] )
    @admin_movies.each do |admin_movie|
      @movie = Movie.find_by(id: admin_movie["_id"])
      @movies << @movie.name
    end
    @admin_theatres = Show.collection.aggregate( [ { "$group" => { "_id" => "$theatre_id", "total_revenue" => { "$sum" => { "$multiply" => ["$cost_per_seat","$num_seats_sold"] } } } } ] )
    @admin_theatres.each do |admin_theatre|
      @theatre = Theatre.find_by(id: admin_theatre["_id"])
      @theatres << @theatre.name
    end
  end
end