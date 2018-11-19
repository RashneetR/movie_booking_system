require 'rails_helper'

RSpec.describe 'myregistrations/index', type: :view do
  before(:each) do
    assign(:myregistrations, [
             Myregistration.create!,
             Myregistration.create!
           ])
  end

  it 'renders a list of myregistrations' do
    render
  end
end
