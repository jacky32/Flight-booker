class AddPassengersToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :passengers, :text, array: true, default: []
  end
end
