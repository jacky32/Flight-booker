class RenamePassengersInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :passenger_id, :user_id
  end
end
