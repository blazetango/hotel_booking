json.extract! room, :id, :room_no, :category_id, :status, :created_at, :updated_at
json.url room_url(room, format: :json)
