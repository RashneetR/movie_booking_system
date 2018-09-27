# frozen_string_literal: true

class Admin::ShowsController < ApplicationController
  before_action :set_admin_show, only: %i[show edit update destroy]

  # GET /admin/shows
  # GET /admin/shows.json
  def index
    @admin_shows = Show.all
  end

  # GET /admin/shows/1
  # GET /admin/shows/1.json
  def show; end

  # GET /admin/shows/new
  def new
    @admin_show = Show.new
    @movie = params[:movie]
    @m = Movie.find_by_id(@movie)
    @name = @m.name
    @theatre = Theatre.all
    puts " \n \n hello #{@name} \n\n"
  end

  # GET /admin/shows/1/edit
  def edit; end

  # POST /admin/shows
  # POST /admin/shows.json
  def create
    @admin_show = Show.new(admin_show_params)

    respond_to do |format|
      if @admin_show.save
        format.html { redirect_to admin_show_path(@admin_show), notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @admin_show }
      else
        format.html { render :new }
        format.json { render json: @admin_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/shows/1
  # PATCH/PUT /admin/shows/1.json
  def update
    respond_to do |format|
      if @admin_show.update(admin_show_params)
        format.html { redirect_to @admin_show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_show }
      else
        format.html { render :edit }
        format.json { render json: @admin_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shows/1
  # DELETE /admin/shows/1.json
  def destroy
    @admin_show.destroy
    respond_to do |format|
      format.html { redirect_to admin_shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_show
    @admin_show = Show.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_show_params
    params.require(:admin_show).permit(:start_time, :end_time, :total_seats, :num_seats_sold, :cost_per_seat, :movie_id, :theatre_id)
  end
end
