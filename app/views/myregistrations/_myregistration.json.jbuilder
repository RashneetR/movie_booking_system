json.extract! myregistration, :id, :created_at, :updated_at
json.url myregistration_url(myregistration, format: :json)