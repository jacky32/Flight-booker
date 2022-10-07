# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = [%w[Prague PRG],
            %w[Birmingham BHX],
            %w[Düsseldorf DUS],
            %w[Rome FCO],
            %w[Athenas ATH],
            %w[Istanbul SAW],
            %w[Vienna VIE],
            %w[Brussels BRU],
            %w[London LTN]]

airports.each do |airport|
  Airport.create(name: airport[0], code: airport[1])
end
