require 'rails_helper'

RSpec.describe "admin/dashboards/index", type: :view do
  before(:each) do
    assign(:admin_dashboards, [
      Admin::Dashboard.create!(
        :index => "Index"
      ),
      Admin::Dashboard.create!(
        :index => "Index"
      )
    ])
  end

  it "renders a list of admin/dashboards" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
