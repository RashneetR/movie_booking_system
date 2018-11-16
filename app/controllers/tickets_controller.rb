class TicketsController < ApplicationController
  load_and_authorize_resource :ticket
  before_action :set_ticket, only: %i[destroy]

  def index
    if current_user.role != 'admin'
      @tickets = Ticket.where(user_id: current_user.id).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    else
      @tickets = Ticket.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show; end

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

  def destroy #required because when we delete an inactive user account after 6 months the task call tickets.destroy to delete the tickets booked by that user
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def update_count
    @show = Show.find_by(id: @ticket.show_id)
    @show.num_seats_sold += @ticket.num_seats_bought
    @show.booking_state = 1 if @show.total_seats == @show.num_seats_sold
    @show.save
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:show_id, :total_cost, :num_seats_bought, :user_id)
  end
end