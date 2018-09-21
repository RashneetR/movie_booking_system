json.extract! movie, :id, :new, :index, :show, :edit, :created_at, :updated_at
json.url movie_url(movie, format: :json)
