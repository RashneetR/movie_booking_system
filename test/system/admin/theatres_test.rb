require 'application_system_test_case'

class Admin::TheatresTest < ApplicationSystemTestCase
  setup do
    @admin_theatre = admin_theatres(:one)
  end

  test 'visiting the index' do
    visit admin_theatres_url
    assert_selector 'h1', text: 'Admin/Theatres'
  end

  test 'creating a Theatre' do
    visit admin_theatres_url
    click_on 'New Admin/Theatre'

    click_on 'Create Theatre'

    assert_text 'Theatre was successfully created'
    click_on 'Back'
  end

  test 'updating a Theatre' do
    visit admin_theatres_url
    click_on 'Edit', match: :first

    click_on 'Update Theatre'

    assert_text 'Theatre was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Theatre' do
    visit admin_theatres_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Theatre was successfully destroyed'
  end
end
