class Report < ApplicationRecord
  belongs_to :booking
  has_one :product, through: :booking
  has_one :user, through: :booking
  has_one :technician, through: :booking, class_name: "User", foreign_key: "user_id"
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers
  has_many :sections, through: :questions
  has_attachments :photos, maximum: 20
  accepts_nested_attributes_for :answers
  after_create :init

  def init
    Question.where(active: true).each do |q|
      if q.product_ids.include?(self.product.id)
        Answer.find_or_create_by(report: self, question: q)
      end
    end
  end


end
