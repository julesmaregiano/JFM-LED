class Section < ApplicationRecord
  has_many :questions
  has_many :answers, through: :questions
  has_many :reports, through: :questions
  validates :name, presence: true, uniqueness: true, allow_blank: true
end
