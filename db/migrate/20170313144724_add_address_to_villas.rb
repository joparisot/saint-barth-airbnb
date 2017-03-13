class AddAddressToVillas < ActiveRecord::Migration[5.0]
  def change
    add_column :villas, :address, :string
  end
end
