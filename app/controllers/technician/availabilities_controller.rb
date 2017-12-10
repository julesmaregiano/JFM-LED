class Technician::AvailabilitiesController < ApplicationController

  def index
    @user = current_user
    @availabilities = Availability.to_come.of(@user)
  end

  def update
    @user = current_user
    @availability = Availability.find(params[:id])
    if @availability.update(params_availability)
      redirect_to technician_availabilities_path
    else
      render :edit
    end
  end

  private

  def params_availability
    params.require(:availability).permit(:status)
  end
end
