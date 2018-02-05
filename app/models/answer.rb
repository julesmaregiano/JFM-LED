class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :report
  belongs_to :option_choice, optional: true
  validates :question, presence: true
  validates :report, presence: true


  def litteral_form
    hash = self.attributes.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id')
    unless hash.compact.empty?
      hash.compact.first[0] == 'option_choice_id' ? OptionChoice.find(hash.compact.first[1]).name : hash.compact.first[1].to_s
    end
  end

  def litteral_answer
    hash = self.attributes.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id')
    if hash.compact.empty?
      "Pas encore de réponse"
    else
      hash.compact.first[0] == 'option_choice_id' ? OptionChoice.find(hash.compact.first[1]).name : hash.compact.first[1].to_s
    end
  end

  def answered?
    if self.attributes.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id').compact.any?
      return true
    end
  end


end
