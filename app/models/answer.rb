class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :report
  has_one :option_choice
  validates :question, presence: true
  validates :report, presence: true


  def litteral_answer
    array = self.attributes.slice('string', 'boolean', 'numeric', 'option_choice_id')
    array.compact.first[0] == 'option_choice_id' ? OptionChoice.find(array.compact.first[1]).name : array.compact.first[1].to_s
  end

end
