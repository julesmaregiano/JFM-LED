class AddReferenceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :reference, :string
  end
end
