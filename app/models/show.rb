class Show
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :start_time, type: Time
  field :end_time, type: Time
  field :total_seats, type: Integer, default: 300
  field :num_seats_sold, type: Integer, default: 0
  field :booking_state, type: String, default: 'vacant'
  field :cost_per_seat, type: Float, default: 200

  #Database associations
  belongs_to :movie
  belongs_to :theatre
  has_many :tickets

  #Validations
  validates :start_time, :end_time, presence: true
  validates :total_seats, presence: true, inclusion: { in: 40..9200 }
  validates :num_seats_sold, presence: true
  validates :cost_per_seat, presence: true, inclusion: { in: 80..1500 }
  validates :booking_state, presence: true
  validate :current_time, on: :create
  validate :check_num_seats_sold

  #Methods
  def current_time
    return unless start_time.present?
      errors.add(:start_time, 'should be greater than current time') if start_time < Time.now
  end

  def check_num_seats_sold
      errors.add(:num_seats_sold, 'Cannot be greater than total seats') if num_seats_sold > total_seats
  end
end
