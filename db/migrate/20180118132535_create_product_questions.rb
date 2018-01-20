class CreateProductQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_questions do |t|
      t.references :question, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
