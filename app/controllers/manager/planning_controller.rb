class Manager::PlanningController < Manager::ApplicationController
  def index
    technician_ids  = service_provider.technician_ids
    @next_date      = beginning + 7.days
    @availabilities = Repositories::Availabilities.for_technicians(technician_ids, beginning, ending)
    @headers        = @availabilities.first.last.map(&:date) unless @availabilities.length.zero?
  end

  def show
    @next_date      = beginning.beginning_of_month + 1.month
    @tech           = current_manager.technicians.find(params[:id])
    @weeks          = weeks.map do |w|
      collection = Repositories::Availabilities.for_technician(@tech.id, w[:start], w[:stop])
      {
        cweek: w[:week],
        start: w[:start],
        stop:  w[:stop],
        items: collection,
        headers: collection.first.map(&:date)
      }
    end
  end

  private

  def weeks
    start = given_date.beginning_of_month
    stop  = start.end_of_month
    (start..stop).to_a.select(&:weekday?).group_by(&:cweek).map do |cweek, items|
      { week: cweek, start: items.first, stop: items.last }
    end
  end

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
