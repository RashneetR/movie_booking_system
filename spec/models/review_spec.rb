require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'validation tests' do

       let(:review) {build(:random_review) }
       
       it "ensures rating presence" do
           review.rating = nil
           expect(review.save).to eq(false)
       end

        it "ensures user_id presence" do
          user2= build(:random_user)
          user2.id = nil
          expect(review.save).to eq(false)
       end

        it "ensures movie_id presence" do
          movie2= build(:random_movie)
          movie2.id = nil
          expect(review.save).to eq(false)
       end
     end
end