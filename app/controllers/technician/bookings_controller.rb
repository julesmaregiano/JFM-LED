class Technician::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings =
  end
end
