class Manager::AvailabilitiesController < ApplicationController

  def index
    @user = current_user
    @availabilities = Availability.all
  end
end
