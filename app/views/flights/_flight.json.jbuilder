json.extract! flight, :id, :arrival_airport_id, :departure_airport_id, :departure_datetime, :arrival_datetime,
              :created_at, :updated_at
json.url flight_url(flight, format: :json)
