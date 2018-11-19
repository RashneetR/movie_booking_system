require 'rails_helper'

RSpec.describe 'Mysessions', type: :request do
  describe 'GET /mysessions' do
    it 'works! (now write some real specs)' do
      get mysessions_path
      expect(response).to have_http_status(200)
    end
  end
end
