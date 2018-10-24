require 'rails_helper'

RSpec.describe "my_devise/registrations/edit", type: :view do
  before(:each) do
    @my_devise_registration = assign(:my_devise_registration, MyDevise::Registration.create!())
  end

  it "renders the edit my_devise_registration form" do
    render

    assert_select "form[action=?][method=?]", my_devise_registration_path(@my_devise_registration), "post" do
    end
  end
end
