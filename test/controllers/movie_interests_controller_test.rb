require 'test_helper'

class MovieInterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_interest = movie_interests(:one)
  end

  test "should get index" do
    get movie_interests_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_interest_url
    assert_response :success
  end

  test "should create movie_interest" do
    assert_difference('MovieInterest.count') do
      post movie_interests_url, params: { movie_interest: { movie_id: @movie_interest.movie_id, user_id: @movie_interest.user_id } }
    end

    assert_redirected_to movie_interest_url(MovieInterest.last)
  end

  test "should show movie_interest" do
    get movie_interest_url(@movie_interest)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_interest_url(@movie_interest)
    assert_response :success
  end

  test "should update movie_interest" do
    patch movie_interest_url(@movie_interest), params: { movie_interest: { movie_id: @movie_interest.movie_id, user_id: @movie_interest.user_id } }
    assert_redirected_to movie_interest_url(@movie_interest)
  end

  test "should destroy movie_interest" do
    assert_difference('MovieInterest.count', -1) do
      delete movie_interest_url(@movie_interest)
    end

    assert_redirected_to movie_interests_url
  end
end
