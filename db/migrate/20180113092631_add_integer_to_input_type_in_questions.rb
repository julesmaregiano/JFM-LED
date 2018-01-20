class AddIntegerToInputTypeInQuestions < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :input_type, 'integer USING CAST(input_type AS integer)'
  end
end
