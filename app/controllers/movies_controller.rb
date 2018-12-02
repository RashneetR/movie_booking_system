class MoviesController < ApplicationController
  before_action :requires_non_admin

  def index
    @movies = Movie.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @movie = Movie.find(params[:id])
    @shows = Show.where(movie_id: @movie.id).paginate(page: params[:page], per_page: 10)
  end
end
