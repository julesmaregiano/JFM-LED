class Technician::UsersController < ApplicationController

  def show
    @user = current_user
    @bookings = Booking.for_next_week
    @bookings_for_map = @bookings.where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@bookings_for_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end

  def index
    @user = current_user
    @users = User.where(role: [0, 1])
  end
end
