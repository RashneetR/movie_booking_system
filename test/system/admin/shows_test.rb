require 'application_system_test_case'

class Admin::ShowsTest < ApplicationSystemTestCase
  setup do
    @admin_show = admin_shows(:one)
  end

  test 'visiting the index' do
    visit admin_shows_url
    assert_selector 'h1', text: 'Admin/Shows'
  end

  test 'creating a Show' do
    visit admin_shows_url
    click_on 'New Admin/Show'

    click_on 'Create Show'

    assert_text 'Show was successfully created'
    click_on 'Back'
  end

  test 'updating a Show' do
    visit admin_shows_url
    click_on 'Edit', match: :first

    click_on 'Update Show'

    assert_text 'Show was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Show' do
    visit admin_shows_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Show was successfully destroyed'
  end
end
