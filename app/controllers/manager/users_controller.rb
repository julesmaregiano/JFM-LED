class Manager::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @user = current_user
    @users = User.where(role: [1, 2, 3]).includes(:company).sort_by(&:company)
  end
end
