class Manager::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.all.sort_by(&:created_at).map do |b| b if b.availabilities.first.user.branch == @user.branch end.compact
  end

  #GET /manager/bookings/news
  def new
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @availabilities = @booking.availabilities.order(date: 'ASC')
    unless @booking.address.latitude.nil?
      @markers = Gmaps4rails.build_markers(@booking) do |booking, marker|
        marker.lat booking.address.latitude
        marker.lng booking.address.longitude
      end
    end
  end

  def edit
    @user = current_user
#    @techs = User.where(role: 2, branch: current_user.branch)
    @availabilities = Availability.all.where(user: User.where(branch: current_user.branch))
    @bookings = Booking.status_is(1).map do |b| b if b.availabilities.first.user.branch == @user.branch end.compact
  end

  def update
    @user = current_user
    @availabilities = Availability.all
    @booking = Booking.find(params[:id])
    old_availabilities = @booking.availabilities
    if params[:booking].nil?
      # Si l'user clique sur "Update" sans avoir sélectionné de date(s), il faut lui refournir de quoi charger l'edit.
      @techs = User.where(role: 2, branch: current_user.branch)
      @bookings = Booking.status_is(1).map do |b| b if b.availabilities.first.user.branch == @user.branch end.compact
      @availabilities = Availability.all.where(user: User.where(branch: current_user.branch))
      render :edit
    elsif old_availabilities.first.pending? && old_availabilities.update(status: "free") && @booking.update(availabilities_params)
      @booking.availabilities.update(status: "booked")
      redirect_to manager_planning_path
    elsif old_availabilities.first.booked? && @booking.update(availabilities_params)
      old_availabilities.update(status: "pending")
      redirect_to manager_planning_path
    else
      render :edit
    end
  end

  private

  def availabilities_params
    params.require(:booking).permit(availability_ids: [])
  end

end
