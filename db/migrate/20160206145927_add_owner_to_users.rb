class AddOwnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :owner, :integer
  end
end
