class Technician::AvailabilitiesController < ApplicationController

  def index
    @user = current_user
    @availabilities = Availability.to_come.of(@user).includes(:booking)
  end

  private

  def params_availability
    params.require(:availability).permit(:status)
  end
end
