class Technician::AvailabilitiesController < ApplicationController

  def index
    @user = current_user
    @availabilities = Availability.all.where(user: @user)
  end
end
