class Manager::UsersController < ApplicationController

  def show
    @user = current_user
    @todays_bookings = Booking.where.not(latitude: nil, longitude: nil).of_the_day
    @markers = Gmaps4rails.build_markers(@todays_bookings) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end

  def index
    @user = current_user
    @users = User.all
  end
end
