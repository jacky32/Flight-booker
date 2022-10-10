class RenamePassengersToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :passengers, :users
  end
end
