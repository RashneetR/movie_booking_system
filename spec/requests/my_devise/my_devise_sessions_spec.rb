require 'rails_helper'

RSpec.describe 'MyDevise::Sessions', type: :request do
  describe 'GET /my_devise_sessions' do
    it 'works! (now write some real specs)' do
      get my_devise_sessions_path
      expect(response).to have_http_status(200)
    end
  end
end
