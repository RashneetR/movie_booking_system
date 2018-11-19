class MovieInterestsController < ApplicationController
  authorize_resource :movie_interest
  before_action :set_movie_interest, only: [:destroy]

  def index
    @movie_interests = if current_user.role == 'admin'
                         MovieInterest.where(movie_id: params[:movie_id]).paginate(page: params[:page], per_page: 10)
                       else
                         MovieInterest.where(user_id: current_user.id).paginate(page: params[:page], per_page: 10)
                       end
  end

  def create
    respond_to do |format|
      if MovieInterest.where(movie_id: params[:movie_id], user_id: current_user.id).empty?
        @movie_interest.movie_id = params[:movie_id]
        @movie_interest.user_id = current_user.id
        @movie_interest.save
        format.html { redirect_to movies_url, notice: 'Movie was successfully subscribed.' }
        format.json { head :no_content }
      else
        format.html { redirect_back(fallback_location: movies_path) }
        flash[:notice] = 'Already Subscribed'
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
end
