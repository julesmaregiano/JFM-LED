class Manager::AvailabilitiesController < ApplicationController

  def index
    @user = current_user
    @techs = User.where(role: 2, branch: current_user.branch)
    @availabilities = Availability.to_come.includes(:user)
  end

  def create
    @user = current_user
    @availability = Availability.new(params_availability)
    if @availability.save
      redirect_to manager_availabilities_path
    else
      render :edit
    end
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
    params.require(:availability).permit(:status, :user_id, :date, :half)
  end
end
