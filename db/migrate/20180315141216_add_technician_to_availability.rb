class AddTechnicianToAvailability < ActiveRecord::Migration[5.1]
  def change
    add_reference :availabilities, :technician, foreign_key: true
  end
end
