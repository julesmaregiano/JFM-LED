class AddDateToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :date, :date
  end
end
