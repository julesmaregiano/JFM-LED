class AddFullAddressToBookings < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookings, :address, :address1
    add_column :bookings, :address2, :string
    add_column :bookings, :address3, :string
    add_column :bookings, :address4, :string
    add_column :bookings, :city, :string
    add_column :bookings, :zipcode, :string
    add_column :bookings, :country, :string
  end
end
