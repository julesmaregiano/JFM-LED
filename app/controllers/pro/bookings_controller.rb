class Pro::BookingsController < ApplicationController
  before_action :set_user
  before_action :set_tech, only: [:new, :create, :edit, :update]

  def index
    @bookings = Booking.where(user_id: @user.id)
    create_markers_for(@bookings)
  end

  def show
    @booking = Booking.find(params[:id])
    @availabilities = @booking.availabilities
    create_markers_for(@booking)
  end

  def new
    @availabilities = Availability.to_come.not_today.free_first
    @products = Product.all
    @booking = Booking.new
  end

  def create
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
    @availabilities = Availability.to_come.not_today.free_first
    @products = Product.all
    @booking = Booking.find(params[:id])
  end

  def update
    @products = Product.all
    @foremen = Foreman.where(branch_id: @user.branch_id).to_a
    @availabilities = Availability.all
    @booking = Booking.find(params[:id])
    if @booking.booked_product_options.where(custom_value: false).destroy_all && @booking.update(booking_params)
      @booking.availabilities.update(status: "pending")
      Availability.where(booking: nil, status: "pending").each {|a| a.reset}
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

  def set_user
    @user = current_user
  end

  def set_tech
    @tech = User.where(role: 3).first
  end


  def booking_params
    params.require(:booking).permit(:comment, :pdf, :foreman_id, :address1, :address2, :zipcode, :city, :country, :product_id, :surface, :reference, availability_ids: [])
  end

  def option_params
    params.require(:options).permit(option_value_ids: [])
  end

  def create_markers_for(bookings)
    unless @booking.latitude.nil? || @booking.latitude.nil?
      @markers = Gmaps4rails.build_markers(bookings) do |booking, marker|
        marker.lat booking.latitude
        marker.lng booking.longitude
      end
    end
  end

  def get_custom_value
    params[:custom_values].each do |option_id, value|
      next unless @booking.product.option_ids.include?(option_id.to_i)
      BookedProductOption.find_or_create_by(option_id: option_id, value: value, booking: @booking, custom_value: true)
    end
  end

end
