class Pro::UsersController < ApplicationController

  def show
    @user = current_user
    @foremen = Foreman.where(branch_id: @user.branch_id)
  end

  def index
    @user = current_user
    @users = User.all
  end
end
