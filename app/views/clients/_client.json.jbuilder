json.extract! client, :id, :name, :last_name, :email, :telephone_number, :created_at, :updated_at
json.url client_url(client, format: :json)
