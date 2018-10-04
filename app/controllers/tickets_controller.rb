# frozen_string_literal: true

class TicketsController < ApplicationController
  #load_and_authorize_resource :ticket
  before_action :set_ticket, only: %i[show edit update destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show; end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit; end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully booked.' }
        format.json { render :show, status: :created, location: @ticket }
        update_count
      else
        flash[:error] = @ticket.errors.full_messages.to_sentence
        format.html { redirect_back(fallback_location: movie_path(@ticket.show.movie.id)) }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def update_count
    @show = Show.find_by_id(@ticket.show_id)
    @show.total_seats -= @ticket.num_seats_bought
    @show.num_seats_sold += @ticket.num_seats_bought
    @show.save
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:show_id, :total_cost, :num_seats_bought, :user_id)
  end
end
