class AddAddressToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :address, foreign_key: true
  end
end
