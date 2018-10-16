# frozen_string_literal: true

# module Admin
# class Admin::TheatresController < BaseController
class Admin::TheatresController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :theatre
  before_action :set_admin_theatre, only: %i[show edit update destroy]

  # GET /admin/theatres
  # GET /admin/theatres.json
  def index
    @admin_theatres = Theatre.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /admin/theatres/1
  # GET /admin/theatres/1.json
  def show
    @shows = Show.where(theatre_id: @admin_theatre.id).paginate(page: params[:page], per_page: 10)
  end

  # GET /admin/theatres/new
  def new
    @admin_theatre = Theatre.new
  end

  # GET /admin/theatres/1/edit
  def edit; end

  # POST /admin/theatres
  # POST /admin/theatres.json
  def create
    @admin_theatre = Theatre.new(admin_theatre_params)

    respond_to do |format|
      if @admin_theatre.save
        format.html { redirect_to admin_theatre_path(@admin_theatre), notice: 'Theatre was successfully created.' }
        format.json { render :show, status: :created, location: @admin_theatre }
      else
        format.html { render :new }
        format.json { render json: @admin_theatre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/theatres/1
  # PATCH/PUT /admin/theatres/1.json
  def update
    respond_to do |format|
      if @admin_theatre.update(admin_theatre_params)
        format.html { redirect_to admin_theatre_path(@admin_theatre), notice: 'Theatre was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_theatre }
      else
        format.html { render :edit }
        format.json { render json: @admin_theatre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/theatres/1
  # DELETE /admin/theatres/1.json
  def destroy
    if @admin_theatre.shows.blank?
      @admin_theatre.destroy
      respond_to do |format|
        format.html { redirect_to admin_theatres_url, notice: 'Theatre was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_theatres_url, notice: 'Cannot delete theatre' }
        format.json { head :no_content }
      end
    end
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_admin_theatre
    @admin_theatre = Theatre.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_theatre_params
    params.require(:admin_theatre).permit(:name)
  end
end
