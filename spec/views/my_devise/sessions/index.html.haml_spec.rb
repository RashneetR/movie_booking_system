require 'rails_helper'

RSpec.describe 'my_devise/sessions/index', type: :view do
  before(:each) do
    assign(:my_devise_sessions, [
             MyDevise::Session.create!,
             MyDevise::Session.create!
           ])
  end

  it 'renders a list of my_devise/sessions' do
    render
  end
end
