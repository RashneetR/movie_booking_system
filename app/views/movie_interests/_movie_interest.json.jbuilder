json.extract! movie_interest, :id, :user_id, :movie_id, :created_at, :updated_at
json.url movie_interest_url(movie_interest, format: :json)