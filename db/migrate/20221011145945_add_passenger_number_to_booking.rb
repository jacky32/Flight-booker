class AddPassengerNumberToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :passenger_number, :integer
  end
end
