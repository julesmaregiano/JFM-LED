class Report < ApplicationRecord
  belongs_to :booking
  has_one :product, through: :booking
  has_one :user, through: :booking
  has_one :technician, through: :booking, class_name: "User", foreign_key: "user_id"
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers
  has_many :sections, through: :questions
  has_attachments :photos, maximum: 20
  accepts_nested_attributes_for :answers, allow_destroy: true

  def signed?
    self.signed_on.any?
  end

  def progress
    answered = 0
    questions = self.product.questions.where(active: true).count
    self.answers.group_by(&:question).each do |question, answers|
      if question.active? && answers.map { |a| a if a.answered? }.any?
        answered += 1
      end
    end
    questions.zero? ? 0 : ((answered.to_f/questions.to_f)*100).round
  end

end
