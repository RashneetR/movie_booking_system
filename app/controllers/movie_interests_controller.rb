class MovieInterestsController < ApplicationController
  before_action :set_movie_interest, only: [:show, :edit, :update, :destroy]

  # GET /movie_interests
  # GET /movie_interests.json
  def index
    @movie_interests = MovieInterest.all
  end

  # GET /movie_interests/1
  # GET /movie_interests/1.json
  def show
  end

  # GET /movie_interests/new
  def new
    @movie_interest = MovieInterest.new
  end

  # GET /movie_interests/1/edit
  def edit
  end

  # POST /movie_interests
  # POST /movie_interests.json
  def create
    @movie_interest = MovieInterest.new(movie_interest_params)

    respond_to do |format|
      if @movie_interest.save
        format.html { redirect_to @movie_interest, notice: 'Movie interest was successfully created.' }
        format.json { render :show, status: :created, location: @movie_interest }
      else
        format.html { render :new }
        format.json { render json: @movie_interest.errors, status: :unprocessable_entity }
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
    @movie_interest.destroy
    respond_to do |format|
      format.html { redirect_to movie_interests_url, notice: 'Movie interest was successfully destroyed.' }
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
      params.require(:movie_interest).permit(:user_id, :movie_id)
    end
end
