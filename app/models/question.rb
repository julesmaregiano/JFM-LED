class Question < ApplicationRecord
  belongs_to :section
  belongs_to :option_group
  has_many :answers
  delegate :option_choices, to: :option_group
  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :input_type, presence: true

  enum input_type: [:option_choice_id, :numeric, :string, :boolean, :date]

  def answer_is(diag)
    self.answers.where(diagnostic: diag).first
  end

  def has_answer?(diag)
    self.answers.where(diagnostic: diag).first.attribute.slice('string', 'boolean', 'numeric', 'option_choice_id').compact.any?
  end

end
