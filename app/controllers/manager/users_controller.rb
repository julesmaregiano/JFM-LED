class Manager::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @user = current_user
    @users = User.all
  end
end
