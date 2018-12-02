require 'application_system_test_case'

class MovieInterestsTest < ApplicationSystemTestCase
  setup do
    @movie_interest = movie_interests(:one)
  end

  test 'visiting the index' do
    visit movie_interests_url
    assert_selector 'h1', text: 'Movie Interests'
  end

  test 'creating a Movie interest' do
    visit movie_interests_url
    click_on 'New Movie Interest'

    fill_in 'Movie', with: @movie_interest.movie_id
    fill_in 'User', with: @movie_interest.user_id
    click_on 'Create Movie interest'

    assert_text 'Movie interest was successfully created'
    click_on 'Back'
  end

  test 'updating a Movie interest' do
    visit movie_interests_url
    click_on 'Edit', match: :first

    fill_in 'Movie', with: @movie_interest.movie_id
    fill_in 'User', with: @movie_interest.user_id
    click_on 'Update Movie interest'

    assert_text 'Movie interest was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Movie interest' do
    visit movie_interests_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Movie interest was successfully destroyed'
  end
end
