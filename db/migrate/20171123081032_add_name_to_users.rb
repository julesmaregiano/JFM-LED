class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_reference :users, :company, foreign_key: true
  end
end
