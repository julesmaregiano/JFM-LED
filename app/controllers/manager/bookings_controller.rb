class Manager::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.all.order(created_at: 'DESC')
    @availabilities = Availability.to_come.not_today.free_first

  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @availabilities = @booking.availabilities.order(date: 'ASC')
    unless @booking.latitude.nil?
      @markers = Gmaps4rails.build_markers(@booking) do |booking, marker|
        marker.lat booking.latitude
        marker.lng booking.longitude
      end
    end
  end

  def edit
    @user = current_user
    @booking = Booking.find(params[:id])
    @availabilities = @booking.availabilities
  end

  def update
    @user = current_user
    @booking = Booking.find(params[:id])
    selected = params[:booking][:availability_ids].reject(&:empty?)
    if @booking.save
      @booking.availabilities.each { |a| selected.include?(a.id.to_s) ? a.update(status: "booked") : a.update(status: "free", booking_id: nil) }
      redirect_to manager_bookings_path
    else
      render :new
    end
  end

  def booking_params
    params.require(:booking).permit(:availabilities, availability_ids: [])
  end

end
