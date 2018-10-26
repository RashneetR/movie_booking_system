require 'test_helper'

class TheatresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @theatre = theatres(:one)
  end

  test "should get index" do
    get admin_theatres_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_theatre_url
    assert_response :success
  end

  test "should create theatre" do
    assert_difference('Theatre.count') do
      post admin_theatres_url, params: { theatre: { edit: @theatre.edit, index: @theatre.index, new: @theatre.new, show: @theatre.show } }
    end

    assert_redirected_to admin_theatre_url(Theatre.last)
  end

  test "should show theatre" do
    get admin_theatre_url(@theatre)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_theatre_url(@theatre)
    assert_response :success
  end

  test "should update theatre" do
    patch admin_theatre_url(@theatre), params: { theatre: { edit: @theatre.edit, index: @theatre.index, new: @theatre.new, show: @theatre.show } }
    assert_redirected_to admin_theatre_url(@theatre)
  end

  test "should destroy theatre" do
    assert_difference('Theatre.count', -1) do
      delete admin_theatre_url(@theatre)
    end

    assert_redirected_to admin_theatres_url
  end
end
