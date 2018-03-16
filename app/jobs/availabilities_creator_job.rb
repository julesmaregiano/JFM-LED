class AvailabilitiesCreatorJob < ApplicationJob
  def perform(technician_id, starts_at, ends_at)
    tech  = Technician.find(technician_id)
    dates = (starts_at..ends_at)
    dates.each do |date|
      tech.availabilities.build do |a|
        a.date   = date
        a.half   = :matin
        a.status = :free
      end
      tech.availabilities.build do |a|
        a.date   = date
        a.half   = :aprem
        a.status = :free
      end
    end

    begin
      Technician.transaction do
        tech.save!
      end
    rescue Exception => e
      Rails.logger.info e.message
    end
  end
end
