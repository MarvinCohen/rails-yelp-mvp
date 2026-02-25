class RenameAdressToAddressInRestaurants < ActiveRecord::Migration[8.1]
  def change
    rename_column :restaurants, :adress, :address
  end
end
