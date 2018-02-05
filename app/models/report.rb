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
    # return true dès qu'une signature de faite
  end

  def progress
    questions = self.product.questions.where(active: true).count
    answered = 0
    self.answers.each do |answer|
      if answer.answered?
        answered += 1
      end
    end
    questions == 0 ? 0 : ((answered.to_f/questions.to_f)*100).round
  end

end
