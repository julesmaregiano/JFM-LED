class AddMailConfirmationToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :send_confirmation_email, :boolean, default: false
  end
end
