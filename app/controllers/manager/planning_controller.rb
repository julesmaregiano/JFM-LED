class Manager::PlanningController < ApplicationController
  def index
    technician_ids  = service_provider.technician_ids
    @availabilities = Repositories::Availabilities.for_technicians(technician_ids, Date.today, Date.today + 5.days)
    @headers        = @availabilities.first.last.map(&:date)
  end

  private

  def service_provider
    current_manager.try(:service_provider)
  end
end
