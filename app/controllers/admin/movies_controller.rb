class Admin::MoviesController < ApplicationController
  before_action :check_role
  #before_action :authenticate_user!
  #load_and_authorize_resource :movie
  before_action :set_admin_movie, only: %i[show edit update destroy change_status]

  def index
    @admin_movies = Movie.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render :show }
      format.js {}
    end
  end

  def new
    @admin_movie = Movie.new
  end

  def edit; end

  def create
    @admin_movie = Movie.new(admin_movie_params)
    respond_to do |format|
      if @admin_movie.save
        format.html { redirect_to admin_movies_url, notice: 'Movie was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @admin_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_movie.update(admin_movie_params)
        format.html { redirect_to admin_movies_url, notice: 'Movie details Updated' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @admin_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @admin_movie.shows.blank? && @admin_movie.reviews.blank?
      @admin_movie.destroy
      respond_to do |format|
        format.html { redirect_to admin_movies_url, notice: 'Movie was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_movies_url, notice: 'Movie cannot be deleted.' }
        format.json { head :no_content }
      end
    end
  end

  def change_status
    @admin_movie.status = 'Now Showing'
    respond_to do |format|
      if @admin_movie.save
        flash[:notice] = 'Successfully updated to Now Showing '
        format.html { redirect_to controller: 'admin/movies', action: 'index' }
        delete_movie_interests
      end
    end
  end

  private

  def set_admin_movie
    @admin_movie = Movie.find(params[:id])
  end

  def admin_movie_params
    params.require(:admin_movie).permit(:name, :summary, :status, :image)
  end

  def delete_movie_interests
    @subscriptions = MovieInterest.where(movie_id: @admin_movie.id)
    @users = @subscriptions.pluck(:user_id)
    @users.each do |user|
      UserMailer.movie_update(user.to_s, @admin_movie.name.to_s).deliver_later
      @subscriptions.each(&:destroy)
    end
  end
end