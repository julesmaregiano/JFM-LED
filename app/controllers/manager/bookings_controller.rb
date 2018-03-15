class Manager::BookingsController < Manager::ApplicationController
  before_action :load_products, only: [:new, :create]

  def index
    @user = current_user
    @bookings = Booking.all.sort_by(&:created_at).map do |b| b if b.availabilities.first.user.branch == @user.branch end.compact
  end

  # GET /manager/bookings/news
  def new
    @booking = Booking.new
  end

  # POST /manager/bookings
  def create
    @booking = service_provider.bookings.build(booking_params)
    if @booking.save
      redirect_to manager_booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking        = service_provider.bookings.find(params[:id])
    @availabilities = @booking.availabilities.order(date: 'ASC')
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

  def booking_params
    params.require(:booking).permit(
      :address, :client_id, :product_id, :send_confirmation_email,
      address_attributes: [:address1]
    )
  end

  def load_products
    @products ||= Product.all
    @clients  ||= Company.all
  end
end
