class Manager::TechniciansController < Manager::ApplicationController
  def index
    @technicians = Technician.where(service_provider_id: current_manager.service_provider_id)
  end

  def edit
    @technician = current_manager.service_provider.technicians.find(params[:id])
  end
end
