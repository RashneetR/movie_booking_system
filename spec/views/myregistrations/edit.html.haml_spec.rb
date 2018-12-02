require 'rails_helper'

RSpec.describe 'myregistrations/edit', type: :view do
  before(:each) do
    @myregistration = assign(:myregistration, Myregistration.create!)
  end

  it 'renders the edit myregistration form' do
    render

    assert_select 'form[action=?][method=?]', myregistration_path(@myregistration), 'post' do
    end
  end
end
