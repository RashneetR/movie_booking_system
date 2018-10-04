require 'rails_helper'

RSpec.describe MovieInterest, type: :model do
  context 'validation tests' do

       let(:movie_interest) {build(:random_movie_interest) }

       it "ensures user_id presence" do
          user2= build(:random_user)
          user2.id = nil
          expect(movie_interest.save).to eq(false)
       end

       it "ensures movie_id presence" do
          movie2= build(:random_movie)
          movie2.id = nil
          expect(movie_interest.save).to eq(false)
       end
  end
end
