class Technician::DashboardsController < ApplicationController

  def show
    @user = current_user
    @bookings_hash = {}
    dates = Date.today.business_dates_until(Date.today + 7)
    dates.each { |d| @bookings_hash[d] = @user.availabilities.where(date: d).map { |a| a.booking }.uniq.compact }

    @bookings_hash.uniq.map do |b|
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
