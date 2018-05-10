json.extract! booking, :id, :from_date, :to_date, :customer_id, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
