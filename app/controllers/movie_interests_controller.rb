class MovieInterestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :movie_interest
  before_action :authorize_request
  before_action :load_movie, only: [:create]
  before_action :set_movie_interest, only: [:destroy]

  def index
    @movie_interests = if current_user.role == 'admin'
                         MovieInterest.where(movie_id: params[:movie_id]).paginate(page: params[:page], per_page: 10)
                       else
                         MovieInterest.where(user_id: current_user.id).paginate(page: params[:page], per_page: 10)
                       end
  end

  def show; end

  def create
    if @movie.status == 'Now Showing'
      redirect_to movies_path, notice: 'Already showing'
    else
      respond_to do |format|
        # if MovieInterest.excludes(movie_id: @movie.id, user_id: current_user.id)
        if MovieInterest.where(movie_id: @movie.id, user_id: current_user.id).empty?
          @movie_interest.movie_id = @movie.id
          @movie_interest.user_id = current_user.id
          @movie_interest.save
          format.html { redirect_to movie_path(@movie), notice: 'Movie was successfully subscribed.' }
          format.json { render :show, status: :created, location: @movie }
        else
          format.html { redirect_back(fallback_location: movies_path) }
          flash[:notice] = 'Already Subscribed'
        end
      end
    end
  end

  def destroy
    @movie_interest.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Unsubscribed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_movie_interest
    @movie_interest = MovieInterest.find(params[:id])
  end

  def movie_interest_params
    # params.require(:movie_interest).permit(:user_id, :movie_id)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end
end