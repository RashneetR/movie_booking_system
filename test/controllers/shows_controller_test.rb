require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show = shows(:one)
  end

  test "should get index" do
    get admin_shows_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_show_url
    assert_response :success
  end

  test "should create show" do
    assert_difference('Show.count') do
      post admin_shows_url, params: { show: { edit: @show.edit, index: @show.index, new: @show.new, show: @show.show } }
    end
    assert_redirected_to admin_show_url(Show.last)
  end

  test "should show show" do
    get admin_show_url(@show)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_show_url(@show)
    assert_response :success
  end

  test "should update show" do
    patch admin_show_url(@show), params: { show: { edit: @show.edit, index: @show.index, new: @show.new, show: @show.show } }
    assert_redirected_to admin_show_url(@show)
  end

  test "should destroy show" do
    assert_difference('Show.count', -1) do
      delete admin_show_url(@show)
    end

    assert_redirected_to admin_shows_url
  end
end
