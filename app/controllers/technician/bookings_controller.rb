class Technician::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.all
    @bookings_for_map = Booking.where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@bookings_for_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end
end
