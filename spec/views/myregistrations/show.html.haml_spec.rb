require 'rails_helper'

RSpec.describe 'myregistrations/show', type: :view do
  before(:each) do
    @myregistration = assign(:myregistration, Myregistration.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
