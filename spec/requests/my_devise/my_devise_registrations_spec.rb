require 'rails_helper'

RSpec.describe 'MyDevise::Registrations', type: :request do
  describe 'GET /my_devise_registrations' do
    it 'works! (now write some real specs)' do
      get my_devise_registrations_path
      expect(response).to have_http_status(200)
    end
  end
end
