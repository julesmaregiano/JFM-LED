class ProductQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :product
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: product_questions
#
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  product_id  :integer
#  question_id :integer
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_product_questions_on_product_id   (product_id)
#  index_product_questions_on_question_id  (question_id)
#
