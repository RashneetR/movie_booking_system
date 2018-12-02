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
  validate :num_seats_booked

  #Callbacks
  after_create :ticket_booked_email

  #Methods
  def num_seats_booked
    errors.add(:num_seats_bought, 'should be less than or equal to remaining number of seats') if num_seats_bought > (self.show.total_seats - self.show.num_seats_sold) 
  end

  def ticket_booked_email
    UserMailer.ticket_booked(id.to_s).deliver_later
  end
end
