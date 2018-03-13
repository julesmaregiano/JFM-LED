class Question < ApplicationRecord
  belongs_to :section
  belongs_to :option_group
  has_many :answers
  has_many :product_questions, dependent: :destroy
  has_many :products, through: :product_questions
  delegate :option_choices, to: :option_group
  validates :name, presence: true, allow_blank: false
  validates :input_type, presence: true
  validates :order, presence: true

  enum display: [:text, :check_boxes, :radio_buttons, :integer]
  enum input_type: [:option_choice_id, :numeric, :string, :boolean, :date]

  def answers_for(report)
    self.answers.where(report: report).map do |answer| answer.litteral_form end
  end

  def has_answer?(report)
    answer = self.answers.where(report: report).first
    unless answer.nil?
      answer.attributes.slice('date', 'string', 'boolean', 'numeric', 'option_choice_id').compact.any?
    end
  end

end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: questions
#
#  active          :boolean
#  created_at      :datetime         not null
#  display         :integer
#  id              :integer          not null, primary key
#  information     :string
#  input_type      :integer
#  name            :string
#  option_group_id :integer
#  order           :integer
#  section_id      :integer
#  slug            :string
#  unit_id         :integer
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_questions_on_option_group_id  (option_group_id)
#  index_questions_on_section_id       (section_id)
#  index_questions_on_unit_id          (unit_id)
#
