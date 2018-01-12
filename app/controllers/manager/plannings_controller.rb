class Manager::PlanningsController < ApplicationController
  def edit
    @user = current_user
    @techs = User.where(role: 2)
    @availabilities = Availability.all
    @bookings = Booking.to_come.status_is(1)
  end
end
