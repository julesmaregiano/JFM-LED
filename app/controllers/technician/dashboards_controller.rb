class Technician::DashboardsController < ApplicationController

  def show
    @user = current_user
    @availabilities = Availability.of_the_week_for(@user)
    @bookings = Booking.for_next_week_for(@user)
    @bookings_for_map = @bookings.delete_if { |booking| booking.nil? || booking.latitude.nil? }
    @markers = Gmaps4rails.build_markers(@bookings_for_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end
end
