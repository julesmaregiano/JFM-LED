class Technician::DashboardsController < ApplicationController

  def show
    @user = current_user
    @bookings_hash = {}
    dates = Date.today.business_dates_until(Date.today + 7)
    dates.each { |d| @bookings_hash[d] = @user.availabilities.where(date: d).map { |a| a.booking }.uniq.compact }

    @bookings_for_map = Booking.for_next_week_for(@user).delete_if { |booking| booking.nil? || booking.latitude.nil? }
    @markers = Gmaps4rails.build_markers(@bookings_for_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end
end
