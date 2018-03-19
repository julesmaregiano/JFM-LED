class Repositories::Availabilities
  def self.for_technicians(tech_ids, starts_at, ends_at)
    self.availabilities(tech_ids, starts_at, ends_at)
      .group_by {|a| a.technician }
      .map do |key, values|
        [
          [key, values.select {|v| v.half.eql?('matin')}].flatten,
          values.select {|v| v.half.eql?('aprem')},
        ]
      end
  end


  def self.for_technician(tech_id, starts_at, ends_at)
    availables = self.availabilities([tech_id], starts_at, ends_at)
    [
       availables.select {|v| v.half.eql?('matin')},
       availables.select {|v| v.half.eql?('aprem')},
    ]
  end

  private

  def self.availabilities(tech_ids, starts_at, ends_at)
    Availability
      .includes(:technician)
      .where(technician_id: tech_ids)
      .where("date  >= ? AND date <= ?", starts_at, ends_at)
      .order(date: :asc)
  end
end
