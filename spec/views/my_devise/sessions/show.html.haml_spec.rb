require 'rails_helper'

RSpec.describe 'my_devise/sessions/show', type: :view do
  before(:each) do
    @my_devise_session = assign(:my_devise_session, MyDevise::Session.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
