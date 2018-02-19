class Question < ApplicationRecord
  belongs_to :section
  belongs_to :option_group
  has_many :answers
  has_many :product_questions, dependent: :destroy
  has_many :products, through: :product_questions
  delegate :option_choices, to: :option_group
  validates :name, presence: true, allow_blank: false
  validates :input_type, presence: true

  enum display: [:text, :check_boxes, :radio_buttons, :integer]
  enum input_type: [:option_choice_id, :numeric, :string, :boolean, :date]

  def answers_for(report)
    self.answers.where(report: report).map do |answer| answer.litteral_form end
  end

  def has_answer?(report)
    self.answers.where(report: report).first.attribute.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id').compact.any?
  end

end
