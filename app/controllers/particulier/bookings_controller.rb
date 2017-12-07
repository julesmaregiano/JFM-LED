class Particulier::BookingsController < ApplicationController

  def index
    @user = current_user
  end
end
