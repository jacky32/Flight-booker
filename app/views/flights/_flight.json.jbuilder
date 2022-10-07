json.extract! flight, :id, :arrival_airport_id, :departing_airport_id, :departure, :flight_duration, :created_at, :updated_at
json.url flight_url(flight, format: :json)
