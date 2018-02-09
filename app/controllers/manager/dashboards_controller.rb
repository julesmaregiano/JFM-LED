class Manager::DashboardsController < ApplicationController

  def show
    @user = current_user
    @todays_bookings = Booking.of_the_day.uniq
    @pending_bookings = Booking.to_come.status_is(1)
    @bookings_addresses = @todays_bookings.map do |b|
      unless b.address.latitude.nil? || b.address.longitude.nil?
        b.address
      end
    end
    @markers = Gmaps4rails.build_markers(@bookings_addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
    end
    @availabilities = Availability.of_the_week.of_last_week
  end

end
