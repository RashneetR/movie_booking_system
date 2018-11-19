require 'rails_helper'

RSpec.describe 'admin/dashboards/new', type: :view do
  before(:each) do
    assign(:admin_dashboard, Admin::Dashboard.new(
                               index: 'MyString'
                             ))
  end

  it 'renders new admin_dashboard form' do
    render

    assert_select 'form[action=?][method=?]', admin_dashboards_path, 'post' do
      assert_select 'input[name=?]', 'admin_dashboard[index]'
    end
  end
end
