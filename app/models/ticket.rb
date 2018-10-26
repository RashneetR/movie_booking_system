class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user, foreign_key: :user_id
  belongs_to :show, foreign_key: :show_id

  field :total_cost, type: Float
  field :num_seats_bought, type: Integer, default: 1

  validates :show_id, presence: true
  validates :total_cost, presence: true
  validates :user_id, presence: true
  validates :num_seats_bought, presence: true, numericality: { greater_than: 0 }

  after_create :ticket_booked_email

  def ticket_booked_email
    UserMailer.ticket_booked(id.to_s).deliver_later
  end
end