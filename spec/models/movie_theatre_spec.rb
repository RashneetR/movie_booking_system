require 'rails_helper'

RSpec.describe MovieTheatre, type: :model do
  context 'validation tests' do

       let(:movie_theatre) {build(:random_movie_theatre) }

       #it "is not valid without a movie" do
        #movie2= build(:movie,movie_id: nil)
        #expect(movie_theatre.save).to_not be_valid
    #end
    #it "is not valid without a theatre" do
        #theatre2= build(:theatre,theatre_id: nil)
        #expect(movie_theatre.save).to_not be_valid
    #end
  end
end
