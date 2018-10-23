# frozen_string_literal: true

class Show 
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :movie, foreign_key: :movie_id
  belongs_to :theatre, foreign_key: :theatre_id
  has_many :tickets
  #enum booking_state: { vacant: 0, booked: 1 }

  field :start_time, type: Time
  field :end_time, type: Time
  field :total_seats, type: Integer, default: 300
  field :num_seats_sold, type: Integer,  default: 0
  field :booking_state, type: String, default: "vacant"
  field :cost_per_seat, type: Float, default: 200

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :total_seats, presence: true, inclusion: { in: 40...9200 }
  validates :num_seats_sold, presence: true
  validates :cost_per_seat, presence: true, inclusion: { in: 80...1500 }
  validates :movie_id, presence: true
  validates :theatre_id, presence: true
  validates :booking_state, presence: true

  validate :current_time
  validate :check_num_seats_sold

  def current_time
    return unless start_time.present?
    #puts "\n\n\n #{Time.now}\n\n\n"
    if Time.now > start_time
    #puts "\n\n\n #{start_time}\n\n\n"
    
      errors.add(:start_time, 'should be greater than current time')
    end
  end

  def check_num_seats_sold
    if total_seats < num_seats_sold
      errors.add(:num_seats_sold, 'Cannot be greater than total seats')
    end
  end
end