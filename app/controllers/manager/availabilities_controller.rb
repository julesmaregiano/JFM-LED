class Manager::AvailabilitiesController < ApplicationController

  def index
    @user = current_user
    @techs = User.all.where(role: 2)
    @availabilities = Availability.all
  end

  def update
    @user = current_user
    @availability = Availability.find(params[:id])
    if @availability.update(params_availability)
      redirect_to manager_availabilities_path
    else
      render :edit
    end
  end

  private

  def params_availability
    params.require(:availability).permit(:status, :user_id)
  end
end
