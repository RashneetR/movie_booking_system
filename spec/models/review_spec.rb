require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'validation tests' do

       let(:review) {build(:random_review) }
       
       it "ensures rating presence" do
           review.rating = nil
           expect(review.save).to eq(false)
       end
     end
end
