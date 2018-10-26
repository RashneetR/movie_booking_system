require "application_system_test_case"

class TheatresTest < ApplicationSystemTestCase
  setup do
    @theatre = theatres(:one)
  end

  test "visiting the index" do
    visit admin_theatres_url
    assert_selector "h1", text: "Theatres"
  end

  test "creating a Theatre" do
    visit admin_theatres_url
    click_on "New Theatre"

    fill_in "Edit", with: @theatre.edit
    fill_in "Index", with: @theatre.index
    fill_in "New", with: @theatre.new
    fill_in "Show", with: @theatre.show
    click_on "Create Theatre"

    assert_text "Theatre was successfully created"
    click_on "Back"
  end

  test "updating a Theatre" do
    visit admin_theatres_url
    click_on "Edit", match: :first

    fill_in "Edit", with: @theatre.edit
    fill_in "Index", with: @theatre.index
    fill_in "New", with: @theatre.new
    fill_in "Show", with: @theatre.show
    click_on "Update Theatre"

    assert_text "Theatre was successfully updated"
    click_on "Back"
  end

  test "destroying a Theatre" do
    visit admin_theatres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Theatre was successfully destroyed"
  end
end