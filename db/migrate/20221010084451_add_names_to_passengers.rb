class AddNamesToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :name, :string
  end
end
