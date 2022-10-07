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
FLIGHT1 = Flight.create(departure_datetime: DateTime.new(2023, 4, 23, 22, 35, 0),
                        arrival_datetime: DateTime.new(2023, 4, 23, 23, 40, 0),
                        departure_airport_id: VIE.id,
                        arrival_airport_id: PRG.id)
