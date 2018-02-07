class DropAnswerOptionChoices < ActiveRecord::Migration[5.1]
  def change
    drop_table :answer_option_choices
  end
end
