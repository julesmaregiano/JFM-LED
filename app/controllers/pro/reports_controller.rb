class Pro::ReportsController < ApplicationController

  def index
  @user = current_user
  @reports = Booking.where(user_id: 3).map do |booking| booking.report end
  end

end
