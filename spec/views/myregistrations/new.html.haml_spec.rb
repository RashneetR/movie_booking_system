require 'rails_helper'

RSpec.describe 'myregistrations/new', type: :view do
  before(:each) do
    assign(:myregistration, Myregistration.new)
  end

  it 'renders new myregistration form' do
    render

    assert_select 'form[action=?][method=?]', myregistrations_path, 'post' do
    end
  end
end
