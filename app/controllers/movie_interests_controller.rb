# frozen_string_literal: true

class MovieInterestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :movie_interest
  before_action :authorize_request
  before_action :load_movie, only: [:create]
  before_action :set_movie_interest, only: [:destroy]

  # GET /movie_interests
  # GET /movie_interests.json
  def index
    @movie_interests = if current_user.role == 'admin'
                         MovieInterest.where(movie_id: params[:movie_id]).paginate(page: params[:page], per_page: 10)
                       else
                         MovieInterest.where(user_id: current_user.id).paginate(page: params[:page], per_page: 10)
                       end
  end

  # GET /movie_interests/1
  # GET /movie_interests/1.json
  def show; end

  # GET /movie_interests/new
  def new
    # @m_id = params[:id]
    @movie_interest = MovieInterest.new
  end

  # GET /movie_interests/1/edit
  def edit; end

  # POST /movie_interests
  # POST /movie_interests.json
  def create
    if @movie.status == 'now_showing'
      redirect_to movies_path, notice: 'Already showing'
    else
      respond_to do |format|
        if current_user.movies.exclude?(@movie)
          current_user.movies << @movie
          format.html { redirect_to movie_path(@movie), notice: 'Movie was successfully subscribed.' }
          format.json { render :show, status: :created, location: @movie }
        else
          format.html { redirect_back(fallback_location: movies_path) }
          flash[:error] = 'Already Subscribed'
        end
      end
    end
  end

  # PATCH/PUT /movie_interests/1
  # PATCH/PUT /movie_interests/1.json
  def update
    respond_to do |format|
      if @movie_interest.update(movie_interest_params)
        format.html { redirect_to @movie_interest, notice: 'Movie interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie_interest }
      else
        format.html { render :edit }
        format.json { render json: @movie_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_interests/1
  # DELETE /movie_interests/1.json
  def destroy
    # user.movies.destroy(m)
    @movie_interest.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Unsubscribed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie_interest
    @movie_interest = MovieInterest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_interest_params
    #params.require(:movie_interest).permit(:user_id, :movie_id)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end
end
