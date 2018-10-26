class MoviesController < ApplicationController
  before_action :check_user
  before_action :authenticate_user!
  load_and_authorize_resource :movie

  def index
    @movies = Movie.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @shows = Show.where(movie_id: @movie.id).paginate(page: params[:page], per_page: 10)
  end
end