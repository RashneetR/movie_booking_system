json.extract! ticket, :id, :new, :index, :show, :edit, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
