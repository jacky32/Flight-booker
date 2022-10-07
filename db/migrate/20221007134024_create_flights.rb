class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_datetime
      t.datetime :arrival_datetime
      t.references :arrival_airport, null: false
      t.references :departure_airport, null: false

      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :arrival_airport_id
    add_foreign_key :flights, :airports, column: :departure_airport_id
  end
end
