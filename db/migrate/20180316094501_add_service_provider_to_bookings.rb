class AddServiceProviderToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :service_provider, foreign_key: true
  end
end
