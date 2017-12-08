class AddForemanToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :foreman
  end
end
