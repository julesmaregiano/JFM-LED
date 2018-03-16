class AddServiceProviderToForemans < ActiveRecord::Migration[5.1]
  def change
    add_reference :foremen, :service_provider, foreign_key: true
  end
end
