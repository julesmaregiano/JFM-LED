class BookingsController < ApplicationController

  def index
    @availabilities = Availability.all
  end

  def new
    @availabilities = Availability.all
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
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
