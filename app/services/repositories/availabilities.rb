class Repositories::Availabilities
  def self.for_technicians(tech_ids, starts_at, ends_at)
    Availability
      .includes(:technician)
      .where(technician_id: tech_ids)
      .of_the_week
      .order(date: :asc)
      .group_by {|a| a.technician }
      .map do |key, values|
        [
          [key, values.select {|v| v.half.eql?('matin')}].flatten,
          values.select {|v| v.half.eql?('aprem')},
        ]
      end
  end
end
