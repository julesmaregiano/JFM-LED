class AddOrderToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :order, :integer
  end
end
