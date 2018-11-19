require 'rails_helper'

RSpec.describe 'admin/dashboards/show', type: :view do
  before(:each) do
    @admin_dashboard = assign(:admin_dashboard, Admin::Dashboard.create!(
                                                  index: 'Index'
                                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Index/)
  end
end
