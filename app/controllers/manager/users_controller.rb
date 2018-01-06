class Manager::UsersController < ApplicationController

  def show
    @user = current_user
    @todays_bookings = Booking.where.not(latitude: nil, longitude: nil).of_the_day.uniq
    @pending_bookings = Booking.to_come.status_is(1)
    @markers = Gmaps4rails.build_markers(@todays_bookings) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
    @availabilities = Availability.of_the_week.of_last_week
  end

  def index
    @user = current_user
    @users = User.all
  end
end
