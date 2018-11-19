require 'rails_helper'

RSpec.describe 'admin/dashboards/edit', type: :view do
  before(:each) do
    @admin_dashboard = assign(:admin_dashboard, Admin::Dashboard.create!(
                                                  index: 'MyString'
                                                ))
  end

  it 'renders the edit admin_dashboard form' do
    render

    assert_select 'form[action=?][method=?]', admin_dashboard_path(@admin_dashboard), 'post' do
      assert_select 'input[name=?]', 'admin_dashboard[index]'
    end
  end
end
