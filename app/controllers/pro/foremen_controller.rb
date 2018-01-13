class Pro::ForemenController < ApplicationController

  def create
    @user = current_user
    @foreman = Foreman.new(params_foreman)
    if @foreman.save
      redirect_to pro_user_path(@user)
    else
      render :new
    end
  end

  private

  def params_foreman
    params.require(:foreman).permit(:first_name, :last_name, :branch_id, :phone)
  end
end
