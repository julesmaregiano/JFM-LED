class AddCompanyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :company, foreign_key: true
    add_reference :users, :branch, foreign_key: true
  end
end
