class Pro::BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
    @bookings_map = @bookings.where.not(latitude: nil, longitude: nil)

    @markers = Gmaps4rails.build_markers(@bookings_map) do |booking, marker|
      marker.lat booking.latitude
      marker.lng booking.longitude
    end
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @availabilities = @booking.availabilities
    unless @booking.latitude.nil? || @booking.latitude.nil?
      @markers = Gmaps4rails.build_markers(@booking) do |booking, marker|
        marker.lat booking.latitude
        marker.lng booking.longitude
      end
    end
  end

  def new
    @user = current_user
    @tech = User.where(role: 3).first
    @availabilities = Availability.to_come.not_today.free_first
    @products = Product.all
    @booking = Booking.new
  end

  def create
    @user = current_user
    @products = Product.all
    @tech = User.where(role: 3).first
    @foremen = Foreman.where(branch_id: @user.branch_id).to_a
    @availabilities = Availability.all
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    if @booking.save
      @booking.availabilities.update(status: "pending")
      Report.create(booking_id: @booking.id)
      option_params[:option_value_ids].each do |option_value_id|
        next unless @booking.product.option_value_ids.include?(option_value_id.to_i)
        BookedProductOption.find_or_create_by(booking_id: @booking.id, option_value_id: option_value_id)
      end
      get_custom_value
      redirect_to pro_dashboard_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @tech = User.where(role: 3).first
    @availabilities = Availability.to_come.not_today.free_first
    @products = Product.all
    @booking = Booking.find(params[:id])
  end

  def update
    @products = Product.all
    @user = current_user
    @tech = User.where(role: 3).first
    @foremen = Foreman.where(branch_id: @user.branch_id).to_a
    @availabilities = Availability.all
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.booked_product_options.where(custom_value: false).destroy_all
      unless params[:option].nil?
        option_params[:option_value_ids].each do |option_value_id|
          next unless @booking.product.option_value_ids.include?(option_value_id.to_i)
          BookedProductOption.find_or_create_by(booking: @booking, option_value_id: option_value_id, option: OptionValue.find(option_value_id).option)
        end
      end
      get_custom_value
      redirect_to pro_dashboard_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :pdf, :foreman_id, :address1, :address2, :zipcode, :city, :country, :product_id, :surface, :reference, availability_ids: [])
  end

  def option_params
    params.require(:options).permit(option_value_ids: [])
  end

  def get_custom_value
    params[:custom_values].each do |option_id, value|
      next unless @booking.product.option_ids.include?(option_id.to_i)
      BookedProductOption.find_or_create_by(option_id: option_id, value: value, booking: @booking, custom_value: true)
    end
  end

end
