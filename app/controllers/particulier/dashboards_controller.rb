class Particulier::DashboardsController < ApplicationController

  def show
    @user = current_user
  end
end
