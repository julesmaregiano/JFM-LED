class AddReportToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :report, foreign_key: true
  end
end
