class AddBookableToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :bookable, polymorphic: true
  end
end
