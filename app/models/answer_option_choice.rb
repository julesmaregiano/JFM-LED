class AnswerOptionChoice < ApplicationRecord
  belongs_to :answer
  belongs_to :option_choice
end
