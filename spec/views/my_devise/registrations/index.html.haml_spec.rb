require 'rails_helper'

RSpec.describe 'my_devise/registrations/index', type: :view do
  before(:each) do
    assign(:my_devise_registrations, [
             MyDevise::Registration.create!,
             MyDevise::Registration.create!
           ])
  end

  it 'renders a list of my_devise/registrations' do
    render
  end
end
