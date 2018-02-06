class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :report
  belongs_to :option_choice, optional: true
  validates :question, presence: true
  validates :report, presence: true


  def litteral_form
    if answers_hash.compact.empty?
      "Pas encore de réponse"
    else
      answers_hash.compact.first[0] == 'option_choice_id' ? OptionChoice.find(answers_hash.compact.first[1]).name : answers_hash.compact.first[1].to_s
    end
  end

  def answers_hash
    self.attributes.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id').delete_if { |k, v| v.nil? || v == "" }
  end

  def answered?
    answers_hash.any?
  end

end
