class Technician::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Availability.of(@user).map { |a| a.booking }.uniq.compact.sort_by { |b| b.created_at }
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @availabilities = @booking.availabilities
    unless @booking.latitude.nil? || @booking.latitude.nil?
      @markers = Gmaps4rails.build_markers(@booking) do |booking, marker|
        marker.lat booking.latitude
        marker.lng booking.longitude
      end
    end
  end

end
