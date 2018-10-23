class Admin::DashboardsController < ApplicationController
  before_action :set_admin_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /admin/dashboards
  # GET /admin/dashboards.json
  def index
    @admin_movies = Show.collection.aggregate( [ { "$group" => { "_id" => "$movie_id","total_revenue" => { "$sum" => { "$multiply" => ["$cost_per_seat","$num_seats_sold"] } } } } ] )
    @movies = []
    @admin_movies.each do |admin_movie|
      @movie = Movie.find_by(id: admin_movie["_id"])
      @movies << @movie.name
    end
    #@admin_movies.map! do |admin_movie|
      #@movie = Movie.find_by(id: admin_movie["_id"])
      #admin_movie["_id"] = @movie.name
      #puts "\nexcuse me #{admin_movie["_id"]}\n\n"
    #end
    @admin_theatres = Show.collection.aggregate( [ { "$group" => { "_id" => "$theatre_id", "total_revenue" => { "$sum" => { "$multiply" => ["$cost_per_seat","$num_seats_sold"] } } } } ] )
    @theatres = []
    @admin_theatres.each do |admin_theatre|
      @theatre = Theatre.find_by(id: admin_theatre["_id"])
      @theatres << @theatre.name
    end
  end
end