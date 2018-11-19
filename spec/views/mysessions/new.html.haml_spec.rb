require 'rails_helper'

RSpec.describe 'mysessions/new', type: :view do
  before(:each) do
    assign(:mysession, Mysession.new)
  end

  it 'renders new mysession form' do
    render

    assert_select 'form[action=?][method=?]', mysessions_path, 'post' do
    end
  end
end
