require 'rails_helper'

RSpec.describe Theatre, type: :model do

   context 'validation tests' do

       let(:theatre) {build(:random_theatre) }
       
       it "ensures name presence" do
           theatre.name = nil
           expect(theatre.save).to eq(false)
       end
    end
end
