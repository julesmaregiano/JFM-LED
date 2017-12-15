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

  def new
    @user = current_user
    @tech = User.where(role: 3).first
    @availabilities = Availability.to_come.not_today
    @booking = Booking.new
  end

  def create
    @user = current_user
    @tech = User.where(role: 3).first
    @foremen = Foreman.where(branch_id: @user.branch_id).to_a
    @availabilities = Availability.all
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.report = Report.new
    if @booking.save
      @booking.availabilities.update(status: 0)
      redirect_to pro_user_path(@user)
    else
      render :new
    end
  end

  def booking_params
    params.require(:booking).permit(:comment, :foreman_id, :address1, :address2, :zipcode, :city, :country, :surface, availability_ids: [])
  end

end
