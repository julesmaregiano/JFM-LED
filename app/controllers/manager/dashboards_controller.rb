class Manager::DashboardsController < Manager::ApplicationController

  def show
    @pending_bookings = []
    @todays_bookings  = Booking.of_the_day.includes(:address, :user, :availabilities, :foreman)
    @pending_bookings = Booking.to_come.includes(:address, :user, :availabilities, :foreman).status_is(1)
   #@bookings_addresses = @todays_bookings.map do |b|
   #  unless b.address.latitude.nil? || b.address.longitude.nil?
   #    b.address
   #  end
   #end
   #@markers = Gmaps4rails.build_markers(@bookings_addresses) do |address, marker|
   #  marker.lat address.latitude
   #  marker.lng address.longitude
   #end
   #@availabilities = Availability.of_the_week.of_last_week.includes(:user)
  end

end
