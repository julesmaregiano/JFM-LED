class Pro::DashboardsController < ApplicationController
  def show
    @user = current_user
    @bookings = Booking.to_come.where(user_id: @user.id).uniq
    @bookings_addresses = Booking.to_come.where(user_id: @user.id).uniq.map do |b|
      unless b.address.latitude.nil? || b.address.longitude.nil?
        b.address
      end
    end
    @markers = Gmaps4rails.build_markers(@bookings_addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
    end
  end
end
