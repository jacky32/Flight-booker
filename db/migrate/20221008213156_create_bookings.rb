class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false
      t.references :passenger, null: false
      t.timestamps
    end
  end
end
