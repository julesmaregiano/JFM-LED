class BookingsController < ApplicationController

  def index
    @availabilities = Availability.all
    @bookings = Bookings.all

  end

  def new
    @availabilities = Availability.all
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    if @booking.save
      render :new
    else
      render :new
    end
  end

  def booking_params
    params.require(:booking).permit(:comment, :address, :surface)
  end
end
