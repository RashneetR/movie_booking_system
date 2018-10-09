# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :show
  validates :show_id, presence: true
  validates :total_cost, presence: true
  validates :user_id, presence: true
  validates :num_seats_bought, presence: true, numericality: { greater_than: 0 }

  after_create :ticket_booked_email

  def ticket_booked_email
    UserMailer.with(ticket: self).ticket_booked.deliver_later
  end
end
