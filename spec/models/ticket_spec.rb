require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'validation tests' do

       let(:ticket) {build(:random_ticket) }
       
       it "ensures total_cost presence" do
           ticket.total_cost = nil
           expect(ticket.save).to eq(false)
       end

       it "ensures num_seats_bought presence" do
           ticket.num_seats_bought = nil
           expect(ticket.save).to eq(false)
       end
     end
end
