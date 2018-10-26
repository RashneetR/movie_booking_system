require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'validation tests' do
    let(:ticket) { build(:random_ticket) }

    it 'ensures total_cost presence' do
      ticket.total_cost = nil
      expect(ticket.save).to eq(false)
    end

    it 'ensures num_seats_bought presence' do
      ticket.num_seats_bought = nil
      expect(ticket.save).to eq(false)
    end

    it 'ensures user_id presence' do
      user2 = build(:random_user)
      user2.id = nil
      expect(ticket.save).to eq(false)
    end

    it 'ensures show_id presence' do
      show2 = build(:random_show)
      show2.id = nil
      expect(ticket.save).to eq(false)
    end
  end
end