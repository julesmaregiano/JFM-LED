class AddSiretToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :siret, :string
  end
end
