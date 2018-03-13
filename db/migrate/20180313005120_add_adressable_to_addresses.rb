class AddAdressableToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :addressable_type, :string
    add_column :addresses, :addressable_id, :integer
    add_index  :addresses, [:addressable_id, :addressable_type]
  end
end
