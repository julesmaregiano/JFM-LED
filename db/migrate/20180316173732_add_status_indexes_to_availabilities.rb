class AddStatusIndexesToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_index :availabilities, [:technician_id, :date, :half], unique: true
  end
end
