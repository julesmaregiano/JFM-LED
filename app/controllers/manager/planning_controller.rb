class Manager::PlanningController < Manager::ApplicationController
  def index
    technician_ids  = service_provider.technician_ids
    @next_date      = beginning + 7.days
    @availabilities = Repositories::Availabilities.for_technicians(technician_ids, beginning, ending)
    @headers        = @availabilities.first.last.map(&:date) unless @availabilities.length.zero?
  end

  def show
    @tech = current_manager.technicians.find(params[:id])
    @availabilities = Repositories::Availabilities.for_technician(@tech.id, Date.today, Date.today + 10.days)
  end

  private

  def given_date
    params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def beginning
    given_date.beginning_of_week
  end

  def ending
    beginning + 4.days
  end

  def service_provider
    current_manager.try(:service_provider)
  end
end
