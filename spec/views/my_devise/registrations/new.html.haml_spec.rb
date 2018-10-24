require 'rails_helper'

RSpec.describe "my_devise/registrations/new", type: :view do
  before(:each) do
    assign(:my_devise_registration, MyDevise::Registration.new())
  end

  it "renders new my_devise_registration form" do
    render

    assert_select "form[action=?][method=?]", my_devise_registrations_path, "post" do
    end
  end
end
