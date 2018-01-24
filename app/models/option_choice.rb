class OptionChoice < ApplicationRecord
  belongs_to :option_group
  has_many :answer_option_choices
  validates :name, presence: true
end
