class Section < ApplicationRecord
  has_many :questions
  has_many :answers, through: :questions
  has_many :reports, through: :answers
  has_many :products, through: :questions
  validates :name, presence: true, uniqueness: true, allow_blank: true
end
