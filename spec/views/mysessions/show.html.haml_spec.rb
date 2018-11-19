require 'rails_helper'

RSpec.describe 'mysessions/show', type: :view do
  before(:each) do
    @mysession = assign(:mysession, Mysession.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
