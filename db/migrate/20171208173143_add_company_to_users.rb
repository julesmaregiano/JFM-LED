class AddCompanyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :company
    add_reference :users, :branch
  end
end
