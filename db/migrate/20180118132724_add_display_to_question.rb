class AddDisplayToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :display, :integer
    add_column :questions, :active, :boolean
  end
end
