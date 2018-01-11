class Pro::ForemenController < ApplicationController

  def create
    @foreman = Foreman.new(params_foreman)
    if @foreman.save
      redirect_to new_pro_booking_path and return
    else
      render :new
    end
  end

  private

  def params_foreman
    params.require(:foreman).permit(:first_name, :last_name, :branch_id, :phone)
  end
end
