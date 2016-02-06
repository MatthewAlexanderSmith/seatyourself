class AddPhoneToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone, :integer, :limit => 8
  end
end
