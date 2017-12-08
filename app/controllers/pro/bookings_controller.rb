class Pro::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
    @bookings_map = @bookings.where.not(latitude: nil, longitude: nil)

    @markers = Gmaps4rails.build_markers(@bookings_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end

  def new
    @user = current_user
    @availabilities = Availability.all
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.report = Report.new

    if @booking.save
      @booking.availabilities.update(status: false)
      redirect_to pro_user_path(@user)
    else
      render :new
    end
  end

  def booking_params
    params.require(:booking).permit(:comment, :address, :surface, availability_ids: [])
  end

end
