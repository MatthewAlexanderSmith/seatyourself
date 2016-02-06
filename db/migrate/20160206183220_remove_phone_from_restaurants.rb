class RemovePhoneFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :phone, :integer
  end
end
