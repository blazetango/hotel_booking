json.extract! hotel, :id, :name, :address, :total_room, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
