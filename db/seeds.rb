# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Airports
PRG = Airport.create(name: 'Prague', code: 'PRG')
BHX = Airport.create(name: 'Birmingham', code: 'BHX')
DUS = Airport.create(name: 'Düsseldorf', code: 'DUS')
FCO = Airport.create(name: 'Rome', code: 'FCO')
ATH = Airport.create(name: 'Athenas', code: 'ATH')
SAW = Airport.create(name: 'Istanbul', code: 'SAW')
VIE = Airport.create(name: 'Vienna', code: 'VIE')
BRU = Airport.create(name: 'Brussels', code: 'BRU')
LTN = Airport.create(name: 'London', code: 'LTN')

# Flights
now = DateTime.now.at_beginning_of_day
a_year_in_future = now + 1.year

50.times do
  Airport.all.each do |departure_air|
    Airport.all.each do |arrival_air|
      next if departure_air == arrival_air

      departure_date = rand(now..a_year_in_future) + rand(0..24).hours + (rand(0..12) * 5).minutes
      arrival_date = departure_date + rand(0..4).hours + rand(0..60).minutes
      Flight.create(
        departure_datetime: departure_date,
        arrival_datetime: arrival_date,
        departure_airport_id: departure_air.id,
        arrival_airport_id: arrival_air.id
      )
    end
  end
end
