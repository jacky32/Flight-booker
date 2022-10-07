class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :departure_airport, class_name: 'Airport'

  def self.search(departure, arrival)
    Flight.where(departure_airport_id: departure, arrival_airport_id: arrival).order(:departure_datetime)
  end
end
