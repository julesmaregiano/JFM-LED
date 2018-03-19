class Manager::PlanningController < Manager::ApplicationController
  def index
    technician_ids  = service_provider.technician_ids
    beginning       = Date.today.beginning_of_week
    ending          = beginning + 5.days
    @availabilities = Repositories::Availabilities.for_technicians(technician_ids, beginning, ending)
    @headers        = @availabilities.first.last.map(&:date)
  end

  private

  def service_provider
    current_manager.try(:service_provider)
  end
end
