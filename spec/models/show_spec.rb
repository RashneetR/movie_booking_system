require 'rails_helper'

RSpec.describe Show, type: :model do
   context 'validation tests' do

       let(:show) {build(:random_show) }
       #show.movie_id = Movie.first.id
       #show.theatre_id = Theatre.first.id

       
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

       it "ensures movie_id presence" do
          movie2= build(:random_movie)
          movie2.id = nil
          expect(show.save).to eq(false)
       end

       it "ensures theatre_id presence" do
          #theatre2= build(:random_theatre)
          #theatre2.id = nil
          show.theatre_id=nil
          expect(show.save).to eq(false)
       end
  end
end
