class Admin::MoviesController < ApplicationController
  before_action :requires_admin
  before_action :set_admin_movie, only: %i[show edit update destroy change_status]
  after_action :send_users_notif, only: %i[change_status]

  def index
    @admin_movies = Movie.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
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
    respond_to do |format|
      if @admin_movie.shows.blank? && @admin_movie.reviews.blank?
        @admin_movie.destroy
        format.html { redirect_to admin_movies_url, notice: 'Movie was successfully destroyed.' }
        format.json { head :no_content }
      else
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
        format.html { redirect_to admin_movies_url }
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

  def send_users_notif
    UserMailer.movie_update(@admin_movie.id.to_s).deliver_later
  end
end
