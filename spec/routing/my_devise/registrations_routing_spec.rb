require 'rails_helper'

RSpec.describe MyDevise::RegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/my_devise/registrations').to route_to('my_devise/registrations#index')
    end

    it 'routes to #new' do
      expect(get: '/my_devise/registrations/new').to route_to('my_devise/registrations#new')
    end

    it 'routes to #show' do
      expect(get: '/my_devise/registrations/1').to route_to('my_devise/registrations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/my_devise/registrations/1/edit').to route_to('my_devise/registrations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/my_devise/registrations').to route_to('my_devise/registrations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/my_devise/registrations/1').to route_to('my_devise/registrations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/my_devise/registrations/1').to route_to('my_devise/registrations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/my_devise/registrations/1').to route_to('my_devise/registrations#destroy', id: '1')
    end
  end
end
