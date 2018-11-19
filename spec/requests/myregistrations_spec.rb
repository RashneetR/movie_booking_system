require 'rails_helper'

RSpec.describe 'Myregistrations', type: :request do
  describe 'GET /myregistrations' do
    it 'works! (now write some real specs)' do
      get myregistrations_path
      expect(response).to have_http_status(200)
    end
  end
end
