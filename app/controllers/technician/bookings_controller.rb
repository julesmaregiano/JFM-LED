class Technician::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.all
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @availabilities = @booking.availabilities
  end

end
