require 'rails_helper'

RSpec.describe "mysessions/index", type: :view do
  before(:each) do
    assign(:mysessions, [
      Mysession.create!(),
      Mysession.create!()
    ])
  end

  it "renders a list of mysessions" do
    render
  end
end
