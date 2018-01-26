class Manager::UsersController < ApplicationController

  def show
    @user = current_user.sort_by(&:last_name)
  end

  def index
    @user = current_user
    @users = User.where(role: [1, 2, 3]).sort_by(&:company)
  end
end
