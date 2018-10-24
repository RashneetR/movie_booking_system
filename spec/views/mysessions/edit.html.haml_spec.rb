require 'rails_helper'

RSpec.describe "mysessions/edit", type: :view do
  before(:each) do
    @mysession = assign(:mysession, Mysession.create!())
  end

  it "renders the edit mysession form" do
    render

    assert_select "form[action=?][method=?]", mysession_path(@mysession), "post" do
    end
  end
end
