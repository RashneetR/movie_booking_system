require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do
    let(:user) { build(:random_user) }

    it 'ensures name presence' do
      user.name = nil
      expect(user.save).to eq(false)
    end

    it 'ensures encrypted_password presence' do
      user.encrypted_password = nil
      expect(user.save).to eq(false)
    end

    it 'ensures email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'ensures role presence' do
      user.role = nil
      expect(user.save).to eq(false)
    end
  end
end