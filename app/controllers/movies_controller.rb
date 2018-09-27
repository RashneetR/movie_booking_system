# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @shows = Show.where(:movie_id == :id)
  end

  def add_movie_interest
    @movie_interest = MovieInterest.new
    @movie_interest.movie_id = params[:id]
    @movie_interest.user_id = current_user.id

    respond_to do |format|
      if @movie_interest.save
        format.html { redirect_to controller: 'movies', action: 'index', notice: 'Successfully subscribed' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.fetch(:movie, {})
  end
end
