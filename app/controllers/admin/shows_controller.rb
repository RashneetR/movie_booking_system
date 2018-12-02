# frozen_string_literal: true

class Admin::ShowsController < ApplicationController
  authorize_resource :show
  before_action :set_admin_show, only: %i[show edit update destroy]

  def index
    @m = Movie.where(status: 'Now Showing')
    @t = Theatre.all
    @admin_show = Show.new
    lookup_show_theatres = { '$lookup' => { 'from' => 'theatres', 'localField' => 'theatre_id', 'foreignField' => '_id', 'as' => 'show_theatre' } }
    unwind_show_theatres = { '$unwind' => '$show_theatre' }
    lookup_show_movies = { '$lookup' => { 'from' => 'movies', 'localField' => 'movie_id', 'foreignField' => '_id', 'as' => 'show_movie' } }
    unwind_show_movies = { '$unwind' => '$show_movie' }
    projection_fields = { '$project' => { '_id' => 1, 'total_seats' => 1, 'num_seats_sold' => 1, 'booking_state' => 1, 'cost_per_seat' => 1, 'start_time' => 1, 'end_time' => 1, 'movie_id' => 1, 'theatre_id' => 1, 'movie_name' => '$show_movie.name', 'theatre_name' => '$show_theatre.name' } }
    if params[:show].nil?
      @admin_shows = Show.collection.aggregate([lookup_show_theatres, unwind_show_theatres, lookup_show_movies, unwind_show_movies, projection_fields])
    else
      ids = []
      tids = []
      unless params[:show][:movie_id].empty?
        ids << to_bson(params[:show][:movie_id])
      end
      unless params[:show][:theatre_id].reject(&:blank?).empty?
        params[:show][:theatre_id].reject(&:blank?).each do |t|
          tids << to_bson(t)
        end
      end
      match_theatre_ids = { 'theatre_id' => { '$in' => tids } }
      match_movie_ids = { 'movie_id' => { '$in' => ids } }
      if ids.empty? && tids.empty?
        @admin_shows = Show.collection.aggregate([lookup_show_theatres, unwind_show_theatres, lookup_show_movies, unwind_show_movies, projection_fields])
      elsif ids.empty?
        @admin_shows = Show.collection.aggregate([lookup_show_theatres, unwind_show_theatres,  lookup_show_movies, unwind_show_movies, { '$match' => match_theatre_ids }, projection_fields])
      elsif tids.empty?
        @admin_shows = Show.collection.aggregate([lookup_show_theatres, unwind_show_theatres,  lookup_show_movies, unwind_show_movies, { '$match' => match_movie_ids }, projection_fields])
      else
        @admin_shows = Show.collection.aggregate([lookup_show_theatres, unwind_show_theatres,  lookup_show_movies, unwind_show_movies, { '$match' => { '$and' => [match_movie_ids, match_theatre_ids] } }, projection_fields])
      end
    end
    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end
  end

  def show; end

  def new
    @admin_show = Show.new
    @theatre = Theatre.all
    if params[:movie]
      @m = []
      @movie = Movie.find(params[:movie])
      @m << @movie
    else
      @m = Movie.where(status: 'Now Showing')
    end
  end

  def edit
    @theatre = Theatre.all
    @m = Movie.all
  end

  def create
    @admin_show = Show.new(admin_show_params)
    respond_to do |format|
      if @admin_show.save
        format.html { redirect_to admin_show_url(@admin_show), notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @admin_show }
      else
        flash[:error] = @admin_show.errors.full_messages.to_sentence
        format.html { redirect_back(fallback_location: new_admin_show_path) }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_show.update(admin_show_params)
        format.html { redirect_to admin_show_path(@admin_show), notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_show }
      else
        flash[:error] = @admin_show.errors.full_messages.to_sentence
        format.html { redirect_to edit_admin_show_path(@admin_show) }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @admin_show.tickets.blank?
        @admin_show.destroy
        format.html { redirect_to admin_shows_url, notice: 'Show was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_shows_url, notice: 'Show cannot be destroyed because tickets exist.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def to_bson(str)
    BSON::ObjectId(str)
  end

  def set_admin_show
    @admin_show = Show.find(params[:id])
  end

  def admin_show_params
    params.require(:admin_show).permit(:start_time, :end_time, :total_seats, :num_seats_sold, :cost_per_seat, :movie_id, :theatre_id)
  end
end
