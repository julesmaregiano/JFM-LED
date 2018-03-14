class Manager::TechniciansController < Manager::ApplicationController
  before_action :find_technician, only: [:edit, :update]

  def index
    @technicians = Technician.where(
      service_provider_id: current_manager.service_provider_id
    )
  end

  def new
    @technician = Technician.new
  end

  def edit
  end

  def create
    sp          = current_manager.service_provider
    @technician = sp.technicians.build(technician_params)

    if @technician.save
      redirect_to manager_technicians_path
    else
      render :new
    end
  end

  def update
    if @technician.update(technician_params)
      redirect_to manager_technicians_path
    else
      render :edit
    end
  end

  private

  def find_technician
    @technician = current_manager.service_provider.technicians.find(params[:id])
  end

  def technician_params
    params.require(:technician).permit(
      :email, :first_name, :last_name,
      address_attributes: [:address1, :address2, :zipcode, :city, :country]
    )
  end
end
