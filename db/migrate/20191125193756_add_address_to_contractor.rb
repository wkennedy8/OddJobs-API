class AddAddressToContractor < ActiveRecord::Migration[6.0]
  def change
    add_column :contractors, :address, :string
  end
end
