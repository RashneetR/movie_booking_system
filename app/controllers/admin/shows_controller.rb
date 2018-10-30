class Admin::ShowsController < ApplicationController
  #before_action :authenticate_user!
  load_and_authorize_resource :show
  before_action :set_admin_show, only: %i[show edit update destroy]

  def index
    @m = Movie.where(status: 'Now Showing')
    @t = Theatre.all
    @admin_show = Show.new
    if params[:show].nil?
      @admin_shows = Show.includes(:theatre, :movie).all.paginate(page: params[:page], per_page: 10)
    else
      @movie_id = params[:show][:movie_id] unless params[:show][:movie_id].nil?
      unless params[:show][:theatre_id].nil?
        @theatre_id = params[:show][:theatre_id]
      end
      if @movie_id.empty? && @theatre_id.count < 2
        @admin_shows = Show.includes(:theatre, :movie).all.paginate(page: params[:page], per_page: 10)
      elsif @movie_id.empty?
        @admin_shows = Show.where(theatre_id: params[:show][:theatre_id]).all.paginate(page: params[:page], per_page: 10)
      elsif @theatre_id.count < 2
        @admin_shows = Show.where(movie_id: @movie_id).all.paginate(page: params[:page], per_page: 10)
      else
        @admin_shows = Show.where(movie_id: @movie_id, theatre_id: params[:show][:theatre_id]).all.paginate(page: params[:page], per_page: 10)
      end
    end
    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end
  end

  def show; end

  def new
    @admin_show = Show.new
    @theatre = Theatre.all
    if params[:movie]
      @m = []
      @movie = Movie.find(params[:movie])
      @m << @movie
    else
      @m = Movie.where(status: 'Now Showing')
    end
  end

  def edit
    @theatre = Theatre.all
    @m = Movie.all
  end

  def create
    @admin_show = Show.new(admin_show_params)
    respond_to do |format|
      if @admin_show.save
        format.html { redirect_to admin_show_url(@admin_show), notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @admin_show }
      else
        flash[:error] = @admin_show.errors.full_messages.to_sentence
        format.html { redirect_back(fallback_location: new_admin_show_path) }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_show.update(admin_show_params)
        format.html { redirect_to admin_show_path(@admin_show), notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_show }
      else
        flash[:error] = @admin_show.errors.full_messages.to_sentence
        format.html { redirect_to edit_admin_show_path(@admin_show) }
      end
    end
  end

  def destroy
    if @admin_show.tickets.blank?
      @admin_show.destroy
      respond_to do |format|
        format.html { redirect_to admin_shows_url, notice: 'Show was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_shows_url, notice: 'Show cannot be destroyed because tickets exist.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_admin_show
    @admin_show = Show.find(params[:id])
  end

  def admin_show_params
    params.require(:admin_show).permit(:start_time, :end_time, :total_seats, :num_seats_sold, :cost_per_seat, :movie_id, :theatre_id)
  end
end