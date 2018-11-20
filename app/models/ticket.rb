class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :total_cost, type: Float
  field :num_seats_bought, type: Integer, default: 1

  #Database associations
  belongs_to :user
  belongs_to :show

  #Validations
  validates :total_cost, presence: true
  validates :num_seats_bought, presence: true, numericality: { greater_than: 0 }

  #Callbacks
  after_create :ticket_booked_email

  #Methods
  def ticket_booked_email
    UserMailer.ticket_booked(id.to_s).deliver_later
  end
end
