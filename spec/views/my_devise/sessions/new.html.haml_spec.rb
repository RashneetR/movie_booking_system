require 'rails_helper'

RSpec.describe "my_devise/sessions/new", type: :view do
  before(:each) do
    assign(:my_devise_session, MyDevise::Session.new())
  end

  it "renders new my_devise_session form" do
    render

    assert_select "form[action=?][method=?]", my_devise_sessions_path, "post" do
    end
  end
end
