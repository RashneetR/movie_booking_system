require 'rails_helper'

RSpec.describe "my_devise/registrations/show", type: :view do
  before(:each) do
    @my_devise_registration = assign(:my_devise_registration, MyDevise::Registration.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
