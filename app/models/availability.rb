class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :booking, optional: true

  scope :of_the_day, -> { where("date = ?", Date.today) }
  scope :to_come, -> { where("date >= ?", Date.today) }
  scope :of, -> (user) {where("user_id = ? ", user.id)}
end
