require 'rails_helper'

RSpec.describe Movie, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do
    let(:movie) { build(:random_movie) }

    it 'ensures name presence' do
      movie.name = nil
      expect(movie.save).to eq(false)
    end

    it 'ensures summary presence' do
      movie.summary = nil
      expect(movie.save).to eq(false)
    end

    it 'ensures status presence' do
      movie.status = nil
      expect(movie.save).to eq(false)
    end
  end
end