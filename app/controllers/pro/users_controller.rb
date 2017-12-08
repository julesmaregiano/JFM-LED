class Pro::UsersController < ApplicationController

  def show
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
    @bookings_map = @bookings.where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@bookings_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
    binding.pry
  end

  def index
    @user = current_user
    @users = User.all
  end
end
