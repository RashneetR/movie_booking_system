class Admin::TheatresController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :theatre
  before_action :set_admin_theatre, only: %i[show edit update destroy]

  def index
    @admin_theatres = Theatre.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @shows = Show.where(theatre_id: @admin_theatre.id).paginate(page: params[:page], per_page: 10)
  end

  def new
    @admin_theatre = Theatre.new
  end

  def edit; end

  def create
    @admin_theatre = Theatre.new(admin_theatre_params)
    respond_to do |format|
      if @admin_theatre.save && @admin_theatre.update(address_attributes: { address: params[:admin_theatre][:address]['address'] })
        format.html { redirect_to admin_theatre_url(@admin_theatre), notice: 'Theatre was successfully created.' }
        format.json { render :show, status: :created, location: @admin_theatre }
      else
        format.html { render :new }
        format.json { render json: @admin_theatre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_theatre.update(admin_theatre_params)
        format.html { redirect_to admin_theatre_url(@admin_theatre), notice: 'Theatre was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_theatre }
      else
        format.html { render :edit }
        format.json { render json: @admin_theatre.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def set_admin_theatre
    @admin_theatre = Theatre.find(params[:id])
  end

  def admin_theatre_params
    params.require(:admin_theatre).permit(:name, address_attributes: [:address, :id])
  end
end