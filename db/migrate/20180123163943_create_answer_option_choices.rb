class CreateAnswerOptionChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_option_choices do |t|
      t.references :answer, foreign_key: true
      t.references :option_choice, foreign_key: true

      t.timestamps
    end
  end
end
