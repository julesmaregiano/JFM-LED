class Manager::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.all.order(created_at: 'DESC')
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
    @techs = User.where(role: 2)
    @availabilities = Availability.all
    @bookings = Booking.to_come.status_is(1)
  end

  def update
    @user = current_user
    @availabilities = Availability.all
    @booking = Booking.find(params[:id])
    old_availabilities = @booking.availabilities
    if old_availabilities.first.pending? && old_availabilities.update(status: "free") && @booking.update(availabilities_params)
      @booking.availabilities.update(status: "booked")
      redirect_to manager_planning_path
    elsif old_availabilities.first.booked? && @booking.update(availabilities_params)
      old_availabilities.update(status: "pending")
      redirect_to manager_planning_path
    else
      render :edit
    end
  end

  def availabilities_params
    params.require(:booking).permit(availability_ids: [])
  end

end
