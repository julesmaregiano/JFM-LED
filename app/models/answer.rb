class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :report
  has_one :option_choice
  validates :question, presence: true
  validates :report, presence: true


  def litteral_answer
    hash = self.attributes.slice('string', 'boolean', 'numeric', 'option_choice_id')
    if hash.compact.empty?
      "Pas encore de réponse"
    else
      hash.compact.first[0] == 'option_choice_id' ? OptionChoice.find(hash.compact.first[1]).name : hash.compact.first[1].to_s
    end
  end


end
