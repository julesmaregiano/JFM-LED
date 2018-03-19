class Manager::PlanningController < Manager::ApplicationController
  def index
    technician_ids  = service_provider.technician_ids
    given           = params[:date].present? ? Date.parse(params[:date]) : Date.today
    beginning       = given.beginning_of_week
    ending          = beginning + 4.days
    @next_date      = beginning + 7.days

    @availabilities = Repositories::Availabilities.for_technicians(technician_ids, beginning, ending)
    @headers        = @availabilities.first.last.map(&:date) unless @availabilities.length.zero?
  end

  def show
    @tech = current_manager.technicians.find(params[:id])
    @availabilities = Repositories::Availabilities.for_technician(@tech.id, Date.today, Date.today + 10.days)
  end

  private

  def service_provider
    current_manager.try(:service_provider)
  end
end
