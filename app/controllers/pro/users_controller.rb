class Pro::UsersController < ApplicationController

  def show
    @user = current_user
    @bookings = Booking.to_come.where(user_id: @user.id).uniq
    @bookings_map = Booking.to_come.where(user_id: @user.id).where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@bookings_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end

  def index
    @user = current_user
    @users = User.all
  end
end
