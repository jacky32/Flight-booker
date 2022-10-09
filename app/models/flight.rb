class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :departure_airport, class_name: 'Airport'
  has_many :bookings

  def arrival_date_formatted
    arrival_datetime.strftime('%R %d. %m. %Y')
  end

  def departure_date_formatted
    departure_datetime.strftime('%R %d. %m. %Y')
  end

  def self.search(departure, arrival, departure_year, departure_month)
    return if departure_month.nil?

    departure_date = DateTime.new(departure_year.to_i, departure_month.to_i)
    dates = [departure_date..departure_date.end_of_month]
    flights = Flight.where(departure_airport_id: departure, arrival_airport_id: arrival)
    dated_flights = flights
    dates.each do |date|
      dated_flights = flights.where(departure_datetime: date)
    end
    dated_flights.order(:departure_datetime)
  end
end
