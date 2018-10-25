class MoviesController < ApplicationController
  before_action :check_user
  before_action :authenticate_user!
  load_and_authorize_resource :movie
  before_action :set_movie, only: [:show]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @shows = Show.where(movie_id: @movie.id).paginate(page: params[:page], per_page: 10)
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
