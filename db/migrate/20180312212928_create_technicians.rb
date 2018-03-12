class CreateTechnicians < ActiveRecord::Migration[5.1]
  def change
    create_table :technicians do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.references :service_provider, foreign_key: true

      t.timestamps
    end
  end
end
