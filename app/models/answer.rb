class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :report
  has_one :option_choice
  validates :question, presence: true
  validates :report, presence: true
  has_many :answer_option_choices

  def litteral_answer
    hash = self.attributes.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id')
    if hash.compact.empty?
      if self.answer_option_choices.exists?
        self.answer_option_choices.map do |a| OptionChoice.find(a.option_choice_id).name end
      else
        "Pas encore de réponse"
      end
    else
      hash.compact.first[0] == 'option_choice_id' ? OptionChoice.find(hash.compact.first[1]).name : hash.compact.first[1].to_s
    end
  end

  def answered?
    if self.attributes.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id').compact.any? || AnswerOptionChoice.where(answer_id: self.id).any?
      return true
    end
  end


end
