class CreateServiceProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :service_providers do |t|
      t.string :name
      t.string :siret

      t.timestamps
    end
  end
end
