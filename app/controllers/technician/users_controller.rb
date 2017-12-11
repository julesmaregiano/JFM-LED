class Technician::UsersController < ApplicationController

  def show
    @user = current_user
    @availabilities = Availability.to_come.of_the_week.of(@user).booked.oldest_to_new
    @bookings = Booking.for_next_week.uniq
    @bookings_for_map = Booking.for_next_week.where.not(latitude: nil, longitude: nil).uniq
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
