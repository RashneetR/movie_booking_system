require 'rails_helper'

RSpec.describe Show, type: :model do
   context 'validation tests' do

       let(:show) {build(:random_show) }
       
       it "ensures start_time presence" do
           show.start_time = nil
           expect(show.save).to eq(false)
       end

       it "ensures end_time presence" do
           show.end_time = nil
           expect(show.save).to eq(false)
       end

       it "ensures total_seats presence" do
           show.total_seats = 0
           expect(show.save).to eq(false)
       end

       it "ensures num_seats_sold presence" do
           show.num_seats_sold = 0
           expect(show.save).to eq(false)
       end

       it "ensures cost_per_seat presence" do
           show.cost_per_seat = nil
           expect(show.save).to eq(false)
       end

       #it "is not valid without a movie" do
        #movie2= build(:movie,movie_id: nil)
        #expect(show.save).to_not be_valid
    #end
  end
end
