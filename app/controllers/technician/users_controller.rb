class Technician::UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.where(role: [0, 1])
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to [@user.role, @user]
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:signature)
  end

end
