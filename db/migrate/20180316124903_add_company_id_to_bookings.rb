class AddCompanyIdToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :company, foreign_key: true
  end
end
