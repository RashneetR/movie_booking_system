require 'test_helper'

class Admin::TheatresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_theatre = admin_theatres(:one)
  end

  test "should get index" do
    get admin_theatres_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_theatre_url
    assert_response :success
  end

  test "should create admin_theatre" do
    assert_difference('Admin::Theatre.count') do
      post admin_theatres_url, params: { admin_theatre: {  } }
    end

    assert_redirected_to admin_theatre_url(Admin::Theatre.last)
  end

  test "should show admin_theatre" do
    get admin_theatre_url(@admin_theatre)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_theatre_url(@admin_theatre)
    assert_response :success
  end

  test "should update admin_theatre" do
    patch admin_theatre_url(@admin_theatre), params: { admin_theatre: {  } }
    assert_redirected_to admin_theatre_url(@admin_theatre)
  end

  test "should destroy admin_theatre" do
    assert_difference('Admin::Theatre.count', -1) do
      delete admin_theatre_url(@admin_theatre)
    end

    assert_redirected_to admin_theatres_url
  end
end
