require 'rails_helper'

RSpec.describe 'my_devise/sessions/edit', type: :view do
  before(:each) do
    @my_devise_session = assign(:my_devise_session, MyDevise::Session.create!)
  end

  it 'renders the edit my_devise_session form' do
    render

    assert_select 'form[action=?][method=?]', my_devise_session_path(@my_devise_session), 'post' do
    end
  end
end
