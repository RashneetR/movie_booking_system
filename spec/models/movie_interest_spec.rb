require 'rails_helper'

RSpec.describe MovieInterest, type: :model do
  context 'validation tests' do

       let(:movie_interest) {build(:random_movie_interest) }

       #it "is not valid without a movie" do
        #movie2= build(:movie,movie_id: nil)
        #expect(movie_interest.save).to_not be_valid
    #end
    #it "is not valid without a user" do
        #user2= build(:user,user_id: nil)
        #expect(movie_interest.save).to_not be_valid
    #end
  end
end
